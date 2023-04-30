// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeViewModel on _HomeViewModelBase, Store {
  late final _$quakesAtom =
      Atom(name: '_HomeViewModelBase.quakes', context: context);

  @override
  List<HomeModel>? get quakes {
    _$quakesAtom.reportRead();
    return super.quakes;
  }

  @override
  set quakes(List<HomeModel>? value) {
    _$quakesAtom.reportWrite(value, super.quakes, () {
      super.quakes = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_HomeViewModelBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$selectedIndexAtom =
      Atom(name: '_HomeViewModelBase.selectedIndex', context: context);

  @override
  int get selectedIndex {
    _$selectedIndexAtom.reportRead();
    return super.selectedIndex;
  }

  @override
  set selectedIndex(int value) {
    _$selectedIndexAtom.reportWrite(value, super.selectedIndex, () {
      super.selectedIndex = value;
    });
  }

  late final _$minmagAtom =
      Atom(name: '_HomeViewModelBase.minmag', context: context);

  @override
  int get minmag {
    _$minmagAtom.reportRead();
    return super.minmag;
  }

  @override
  set minmag(int value) {
    _$minmagAtom.reportWrite(value, super.minmag, () {
      super.minmag = value;
    });
  }

  late final _$getQuakesAsyncAction =
      AsyncAction('_HomeViewModelBase.getQuakes', context: context);

  @override
  Future<void> getQuakes() {
    return _$getQuakesAsyncAction.run(() => super.getQuakes());
  }

  late final _$_HomeViewModelBaseActionController =
      ActionController(name: '_HomeViewModelBase', context: context);

  @override
  void changeSelected(int newIndex) {
    final _$actionInfo = _$_HomeViewModelBaseActionController.startAction(
        name: '_HomeViewModelBase.changeSelected');
    try {
      return super.changeSelected(newIndex);
    } finally {
      _$_HomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeLoading() {
    final _$actionInfo = _$_HomeViewModelBaseActionController.startAction(
        name: '_HomeViewModelBase.changeLoading');
    try {
      return super.changeLoading();
    } finally {
      _$_HomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeMinmag(int newMinmag) {
    final _$actionInfo = _$_HomeViewModelBaseActionController.startAction(
        name: '_HomeViewModelBase.changeMinmag');
    try {
      return super.changeMinmag(newMinmag);
    } finally {
      _$_HomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
quakes: ${quakes},
isLoading: ${isLoading},
selectedIndex: ${selectedIndex},
minmag: ${minmag}
    ''';
  }
}
