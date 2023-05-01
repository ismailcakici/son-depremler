import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:mobx/mobx.dart';
import 'package:son_depremler/core/base/viewmodel/base_view_model.dart';
import 'package:geolocator/geolocator.dart';

part 'map_view_model.g.dart';

// ignore: library_private_types_in_public_api
class MapViewModel = _MapViewModelBase with _$MapViewModel;

abstract class _MapViewModelBase with Store, BaseViewModel {
  late MapController mapController;
  @action
  Future findLocationAndMove() async {
    await Geolocator.checkPermission().then((permission) async {
      if (permission.index == 2) {
        Position location = await Geolocator.getCurrentPosition();
        mapController.move(LatLng(location.latitude, location.longitude), 10);
      } else {
        await Geolocator.requestPermission();
      }
    });
  }

  @override
  void setContext(BuildContext context) => baseContext = context;

  @override
  void init() {
    mapController = MapController();
  }
}
