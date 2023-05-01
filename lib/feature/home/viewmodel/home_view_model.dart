// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:son_depremler/core/base/viewmodel/base_view_model.dart';
import 'package:son_depremler/core/constants/enums/status_enums.dart';
import 'package:son_depremler/core/init/network/service/service_manager.dart';
import 'package:son_depremler/feature/home/model/home_model.dart';
import 'package:son_depremler/feature/home/service/home_service.dart';
import 'package:son_depremler/product/constants/product_constants.dart';

import '../service/i_home_service.dart';
part 'home_view_model.g.dart';

class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;

abstract class _HomeViewModelBase with Store, BaseViewModel {
  late IHomeService homeService;
  @observable
  List<HomeModel>? quakes;
  @observable
  StatusEnum status = StatusEnum.initial;
  @observable
  int selectedIndex = 0;
  @observable
  int minmag = 0;
  @action
  void changeSelected(int newIndex) => selectedIndex = newIndex;
  @action
  void changeStatus(StatusEnum newStatus) => status = newStatus;
  @action
  void changeMinmag(int newMinmag) => minmag = newMinmag;
  @action
  Future<void> getQuakes() async {
    changeStatus(StatusEnum.loading);
    final response = await homeService.fetchLatestQuakes(
      ProductConstants.dateTimeyesterday.toString(),
      ProductConstants.dateTimeNow.toString(),
      minmag,
    );
    quakes = response;
    quakes!.isEmpty
        ? changeStatus(StatusEnum.empty)
        : changeStatus(StatusEnum.succes);
  }

  @override
  void setContext(BuildContext context) => baseContext = context;

  @override
  void init() {
    homeService = HomeService(ServiceManager.instance.networkManager);
    getQuakes();
  }
}
