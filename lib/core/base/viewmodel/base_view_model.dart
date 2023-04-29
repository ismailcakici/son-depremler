import 'package:flutter/material.dart';

abstract class BaseViewModel {
  late BuildContext baseContext;

  void setContext(BuildContext context);
  void init();
}
