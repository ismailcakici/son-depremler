import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:son_depremler/core/base/view/base_view.dart';
import 'package:son_depremler/core/init/theme/color_scheme/color_scheme_light.dart';
import 'package:son_depremler/feature/home/model/home_model.dart';
import 'package:son_depremler/feature/map/viewmodel/map_view_model.dart';
import 'package:son_depremler/product/widgets/custom_map/custom_map.dart';

class MapView extends StatelessWidget {
  final List<HomeModel>? quakes;
  const MapView({
    Key? key,
    required this.quakes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<MapViewModel>(
      viewModel: MapViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (context, viewModel) {
        return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(),
          floatingActionButton: Observer(
            builder: (context) {
              return FloatingActionButton(
                onPressed: () async {
                  await viewModel.moveToCenter();
                },
                child: viewModel.isLoading
                    ? CircularProgressIndicator(
                        color: ColorSchemeLight.instance.white,
                      )
                    : const Icon(Icons.my_location),
              );
            },
          ),
          body: CustomMap(
            quakes: quakes,
            mapViewModel: viewModel,
          ),
        );
      },
    );
  }
}
