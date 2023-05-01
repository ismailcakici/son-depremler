import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:son_depremler/core/constants/enums/status_enums.dart';
import 'package:son_depremler/core/constants/extensions/string_extension.dart';
import 'package:son_depremler/core/init/lang/locale_keys.g.dart';
import 'package:son_depremler/feature/home/viewmodel/home_view_model.dart';
import 'package:son_depremler/product/widgets/detail_bottom_sheet/detail_bottom_sheet.dart';

import '../../../feature/home/model/home_model.dart';
import '../quake_listtile/quake_listtile.dart';

class QuakeListViewBuilder extends StatelessWidget {
  final HomeViewModel viewModel;
  const QuakeListViewBuilder({
    super.key,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        switch (viewModel.status) {
          case StatusEnum.loading:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case StatusEnum.empty:
            return Center(
              child: Text(
                LocaleKeys.home_no_data.translate,
                textAlign: TextAlign.center,
              ),
            );
          case StatusEnum.succes:
            return RefreshIndicator(
              onRefresh: () async {
                await viewModel.getQuakes();
              },
              child: ListView.builder(
                itemCount: viewModel.quakes?.length,
                itemBuilder: (BuildContext context, int index) {
                  HomeModel? quake = viewModel.quakes?[index];
                  return QuakeListtile(
                    quake: quake,
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) =>
                              DetailBottomSheet(quake: quake));
                    },
                  );
                },
              ),
            );
          default:
            return const SizedBox.shrink();
        }
      },
    );
  }
}
