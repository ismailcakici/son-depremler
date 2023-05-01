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
  @observable
  bool isLoading = false;

  @action
  void changeLoading() => isLoading = !isLoading;

  @action
  Future<void> moveToCenter() async {
    changeLoading();
    await getLocation().then((position) {
      if (position == null) return;
      mapController.move(
          LatLng(
            position.latitude,
            position.longitude,
          ),
          10);
    });
    changeLoading();
  }

  @action
  Future<Position?> getLocation() async {
    LocationPermission permission = await checkPermission();
    if (permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse) {
      Position? position = await Geolocator.getCurrentPosition();
      return position;
    } else {
      await requestPermission();
    }
    return null;
  }

  @action
  Future<LocationPermission> checkPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    return permission;
  }

  @action
  Future<void> requestPermission() async {
    await Geolocator.requestPermission();
  }

  @override
  void setContext(BuildContext context) => baseContext = context;

  @override
  void init() {
    mapController = MapController();
  }
}
