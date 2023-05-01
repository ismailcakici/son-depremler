import 'package:flutter/material.dart';
import 'package:son_depremler/core/init/navigation/navigation_manager.dart';
import 'package:son_depremler/core/init/network/service/service_manager.dart';

abstract class BaseViewModel {
  late BuildContext baseContext;

  ServiceManager serviceManager = ServiceManager.instance;
  NavigationManager navigationManager = NavigationManager.instance;
  void setContext(BuildContext context);
  void init();
}
