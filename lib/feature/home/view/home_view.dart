import 'package:flutter/material.dart';
import 'package:son_depremler/core/base/view/base_view.dart';
import 'package:son_depremler/core/constants/enums/image_enum.dart';
import 'package:son_depremler/core/constants/extensions/image_extension.dart';
import 'package:son_depremler/core/constants/extensions/string_extension.dart';
import 'package:son_depremler/core/init/lang/locale_keys.g.dart';
import 'package:son_depremler/core/init/theme/color_scheme/color_scheme_light.dart';
import 'package:son_depremler/feature/home/viewmodel/home_view_model.dart';
import 'package:son_depremler/product/widgets/quake_list_view_builder/quake_list_view_builder.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      viewModel: HomeViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (context, viewModel) {
        return Scaffold(
          floatingActionButton: _buildFabs(),
          appBar: _buildAppBar(),
          drawer: _buildDrawer(),
          body: _buildQuakeList(viewModel),
        );
      },
    );
  }

  QuakeListViewBuilder _buildQuakeList(HomeViewModel viewModel) =>
      QuakeListViewBuilder(viewModel: viewModel);

  Drawer _buildDrawer() => const Drawer();

  AppBar _buildAppBar() => AppBar(
        title: Text(LocaleKeys.appTitle.translate),
      );

  Row _buildFabs() => Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {},
            backgroundColor: ColorSchemeLight.instance.white,
            child: Image.asset(ImageEnum.whistle.imagePath, height: 40),
          ),
          const SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            onPressed: () {},
            backgroundColor: ColorSchemeLight.instance.white,
            child: Image.asset(ImageEnum.map.imagePath, height: 40),
          ),
        ],
      );
}
