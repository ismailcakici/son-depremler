import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:son_depremler/feature/home/model/home_model.dart';

import '../../../core/init/theme/color_scheme/color_scheme_light.dart';

class CustomMap extends StatelessWidget {
  final MapController mapController;
  final List<HomeModel> quakes;
  const CustomMap({Key? key, required this.mapController, required this.quakes})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      mapController: mapController,
      options: MapOptions(
        center: LatLng(
          37.575275,
          36.922821,
        ),
        zoom: 9,
      ),
      nonRotatedChildren: [
        CircleLayer(
          circles: List.generate(
            quakes.length,
            (index) => CircleMarker(
              color: ColorSchemeLight.instance.red.withOpacity(0.5),
              point: LatLng(
                double.parse(quakes[index].latitude!),
                double.parse(quakes[index].longitude!),
              ),
              radius: 10 * double.parse(quakes[index].magnitude!),
            ),
          ),
        ),
      ],
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'com.example.app',
        ),
      ],
    );
  }
}
