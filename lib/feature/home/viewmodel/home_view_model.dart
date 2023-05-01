import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:son_depremler/core/base/viewmodel/base_view_model.dart';
import 'package:son_depremler/core/constants/enums/navigation_enums.dart';
import 'package:son_depremler/core/constants/enums/status_enums.dart';
import 'package:son_depremler/core/init/lang/language_manager.dart';
import 'package:son_depremler/core/init/network/service/service_manager.dart';
import 'package:son_depremler/feature/home/model/home_model.dart';
import 'package:son_depremler/feature/home/service/home_service.dart';
import 'package:son_depremler/product/constants/product_constants.dart';
import 'package:easy_localization/easy_localization.dart';

import '../service/i_home_service.dart';
part 'home_view_model.g.dart';

// ignore: library_private_types_in_public_api
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
  void changeLanguage() {
    if (baseContext.locale == LanguageManager.instance.trLocale) {
      baseContext.setLocale(LanguageManager.instance.enLocale);
    } else {
      baseContext.setLocale(LanguageManager.instance.trLocale);
    }
  }

  @action
  void changeSelected(int newIndex) => selectedIndex = newIndex;
  @action
  void changeStatus(StatusEnum newStatus) => status = newStatus;
  @action
  void changeMinmag(int newMinmag) => minmag = newMinmag;
  @action
  void navigateToMapView() =>
      navigationManager.router.push(NavigationEnums.mapView.routeName,
          extra: quakes as List<HomeModel>);
  @action
  void navigateToWhistleView() =>
      navigationManager.router.push(NavigationEnums.whistleView.routeName);
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
