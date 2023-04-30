import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kartal/kartal.dart';
import 'package:son_depremler/feature/home/viewmodel/home_view_model.dart';

class MinmagFilterBuilder extends StatelessWidget {
  final HomeViewModel viewModel;
  const MinmagFilterBuilder({
    super.key,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height / 10,
      child: ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: context.paddingLow,
            child: Observer(
              builder: (context) {
                return FilterChip(
                  label: Text('$index\t>'),
                  selected: viewModel.selectedIndex == index ? true : false,
                  onSelected: (value) {
                    viewModel.changeSelected(index);
                    viewModel.changeMinmag(index);
                    viewModel.getQuakes();
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}
