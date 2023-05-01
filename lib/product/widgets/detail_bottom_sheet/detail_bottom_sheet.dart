// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:son_depremler/core/constants/extensions/string_extension.dart';
import 'package:son_depremler/core/init/lang/locale_keys.g.dart';
import 'package:son_depremler/core/init/theme/color_scheme/color_scheme_light.dart';
import 'package:son_depremler/feature/home/model/home_model.dart';

import '../custom_map/custom_detail_map.dart';

class DetailBottomSheet extends StatelessWidget {
  final HomeModel? quake;
  const DetailBottomSheet({Key? key, required this.quake}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AspectRatio(
          aspectRatio: 2.5 / 1,
          child: CustomDetailMap(quake: quake),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildDivider(),
                Text(
                  LocaleKeys.home_place.translate + '\t:\t' + quake!.province!,
                ),
                _buildDivider(),
                Text(
                  '${LocaleKeys.home_time.translate}\t:\t${DateFormat.Hms(context.locale.languageCode).format(
                    DateTime.parse(quake?.date ?? ''),
                  )}',
                ),
                _buildDivider(),
                Text(
                  '${LocaleKeys.home_date.translate}\t:\t${DateFormat.yMMMMEEEEd(context.locale.languageCode).format(
                    DateTime.parse(quake?.date ?? ''),
                  )}',
                ),
                _buildDivider(),
                Text(LocaleKeys.home_depth.translate +
                    '\t:\t' +
                    quake!.depth! +
                    '\t KM'),
                _buildDivider(),
                Text(
                    LocaleKeys.home_lat.translate + '\t:\t' + quake!.latitude!),
                _buildDivider(),
                Text(LocaleKeys.home_lon.translate +
                    '\t:\t' +
                    quake!.longitude!),
                _buildDivider(),
                Text(LocaleKeys.home_mag.translate +
                    '\t:\t' +
                    quake!.magnitude!),
                _buildDivider(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Divider _buildDivider() => Divider(
        endIndent: 5,
        indent: 5,
        thickness: 1,
        color: ColorSchemeLight.instance.grey,
      );
}
