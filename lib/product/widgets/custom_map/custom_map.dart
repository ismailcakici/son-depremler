import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:kartal/kartal.dart';
import 'package:latlong2/latlong.dart';
import 'package:son_depremler/core/constants/enums/image_enum.dart';
import 'package:son_depremler/core/constants/extensions/image_extension.dart';
import 'package:son_depremler/core/init/theme/color_scheme/color_scheme_light.dart';
import 'package:son_depremler/feature/home/model/home_model.dart';

class CustomDetailMap extends StatelessWidget {
  final HomeModel? quake;
  const CustomDetailMap({Key? key, this.quake}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: context.normalRadius,
        topRight: context.normalRadius,
      ),
      child: FlutterMap(
        options: MapOptions(
          center: LatLng(
            double.parse(quake!.latitude!),
            double.parse(quake!.longitude!),
          ),
          zoom: 9.2,
        ),
        nonRotatedChildren: [
          CircleLayer(
            circles: [
              CircleMarker(
                borderColor: ColorSchemeLight.instance.red,
                borderStrokeWidth: 3,
                color: ColorSchemeLight.instance.red.withOpacity(0.5),
                point: LatLng(
                  double.parse(quake!.latitude!),
                  double.parse(quake!.longitude!),
                ),
                radius: 15 * double.parse(quake!.magnitude!),
              ),
            ],
          ),
          MarkerLayer(
            markers: [
              Marker(
                point: LatLng(
                  double.parse(quake!.latitude!),
                  double.parse(quake!.longitude!),
                ),
                builder: (context) {
                  return Image.asset(ImageEnum.quake.imagePath);
                },
              ),
            ],
          ),
        ],
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.example.app',
          ),
        ],
      ),
    );
  }
}
