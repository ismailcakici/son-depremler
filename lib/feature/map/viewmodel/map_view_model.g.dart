// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MapViewModel on _MapViewModelBase, Store {
  late final _$isLoadingAtom =
      Atom(name: '_MapViewModelBase.isLoading', context: context);

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

  late final _$moveToCenterAsyncAction =
      AsyncAction('_MapViewModelBase.moveToCenter', context: context);

  @override
  Future<void> moveToCenter() {
    return _$moveToCenterAsyncAction.run(() => super.moveToCenter());
  }

  late final _$getLocationAsyncAction =
      AsyncAction('_MapViewModelBase.getLocation', context: context);

  @override
  Future<Position?> getLocation() {
    return _$getLocationAsyncAction.run(() => super.getLocation());
  }

  late final _$checkPermissionAsyncAction =
      AsyncAction('_MapViewModelBase.checkPermission', context: context);

  @override
  Future<LocationPermission> checkPermission() {
    return _$checkPermissionAsyncAction.run(() => super.checkPermission());
  }

  late final _$requestPermissionAsyncAction =
      AsyncAction('_MapViewModelBase.requestPermission', context: context);

  @override
  Future<void> requestPermission() {
    return _$requestPermissionAsyncAction.run(() => super.requestPermission());
  }

  late final _$_MapViewModelBaseActionController =
      ActionController(name: '_MapViewModelBase', context: context);

  @override
  void changeLoading() {
    final _$actionInfo = _$_MapViewModelBaseActionController.startAction(
        name: '_MapViewModelBase.changeLoading');
    try {
      return super.changeLoading();
    } finally {
      _$_MapViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading}
    ''';
  }
}
