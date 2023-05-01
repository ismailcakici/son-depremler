import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:son_depremler/core/base/view/base_view.dart';
import 'package:son_depremler/feature/home/model/home_model.dart';
import 'package:son_depremler/feature/map/viewmodel/map_view_model.dart';
import 'package:son_depremler/product/widgets/custom_map/custom_map.dart';

class MapView extends StatelessWidget {
  final List<HomeModel>? quakes;
  const MapView({Key? key, this.quakes}) : super(key: key);

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
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              viewModel.findLocationAndMove();
            },
            child: const Icon(Icons.my_location),
          ),
          body: CustomMap(
            mapController: viewModel.mapController,
            quakes: quakes ?? [],
          ),
        );
      },
    );
  }
}
