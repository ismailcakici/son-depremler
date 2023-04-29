import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:son_depremler/core/constants/extensions/string_extension.dart';
import 'package:son_depremler/core/init/lang/locale_keys.g.dart';
import 'package:son_depremler/core/init/theme/color_scheme/color_scheme_light.dart';
import 'package:son_depremler/feature/home/model/home_model.dart';

class QuakeListtile extends StatelessWidget {
  final HomeModel? quake;
  final VoidCallback onTap;
  const QuakeListtile({Key? key, required this.quake, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingLow,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: context.normalBorderRadius,
          shape: BoxShape.rectangle,
          border: Border.all(
            width: 0.7,
            color: ColorSchemeLight.instance.darkGrey,
            style: BorderStyle.solid,
          ),
        ),
        clipBehavior: Clip.antiAlias,
        width: double.infinity,
        height: context.height / 10,
        child: ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: context.normalBorderRadius,
          ),
          onTap: onTap,
          leading: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                double.parse(quake!.magnitude!).toStringAsFixed(1),
                style: TextStyle(
                  color: ColorSchemeLight.instance.red,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          title: Text(quake?.location ?? ''),
          subtitle: Text(
            '${LocaleKeys.home_date.translate}\t:\t${DateFormat.yMMMEd(context.locale.languageCode).format(
              DateTime.parse(quake?.date ?? ''),
            )}',
          ),
          trailing: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.chevron_right),
            ],
          ),
        ),
      ),
    );
  }
}
