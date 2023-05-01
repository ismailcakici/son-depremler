import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:son_depremler/core/base/viewmodel/base_view_model.dart';
import 'package:son_depremler/product/constants/product_constants.dart';
part 'whistle_view_model.g.dart';

// ignore: library_private_types_in_public_api
class WhistleViewModel = _WhistleViewModelBase with _$WhistleViewModel;

abstract class _WhistleViewModelBase with Store, BaseViewModel {
  late AssetsAudioPlayer assetsAudioPlayer;
  @action
  void playWhistle() {
    assetsAudioPlayer.open(
      Audio(ProductConstants.audioUrl),
    );
  }

  @override
  void init() {
    assetsAudioPlayer = AssetsAudioPlayer.newPlayer();
  }

  @override
  void setContext(BuildContext context) => baseContext = context;
}
