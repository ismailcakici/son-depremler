import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:son_depremler/core/base/view/base_view.dart';
import 'package:son_depremler/core/constants/enums/image_enum.dart';
import 'package:son_depremler/core/constants/extensions/image_extension.dart';
import 'package:son_depremler/core/constants/extensions/string_extension.dart';
import 'package:son_depremler/core/init/lang/locale_keys.g.dart';
import 'package:son_depremler/core/init/theme/color_scheme/color_scheme_light.dart';
import 'package:son_depremler/feature/whistle/viewmodel/whistle_view_model.dart';

class WhistleView extends StatelessWidget {
  const WhistleView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: WhistleViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (context, viewModel) {
        return Scaffold(
          backgroundColor: ColorSchemeLight.instance.red,
          appBar: AppBar(),
          extendBodyBehindAppBar: true,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => viewModel.playWhistle(),
                  child: Image.asset(
                    ImageEnum.sos.imagePath,
                    height: context.height / 3,
                  ),
                ),
                Padding(
                  padding: context.paddingLow,
                  child: Text(
                    LocaleKeys.home_whistle.translate,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: ColorSchemeLight.instance.white),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
