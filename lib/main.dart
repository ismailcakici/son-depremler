import 'package:flutter/material.dart';
import 'package:son_depremler/core/constants/app/app_constants.dart';
import 'package:son_depremler/core/init/lang/language_manager.dart';
import 'package:son_depremler/core/init/navigation/navigation_manager.dart';
import 'package:son_depremler/core/init/theme/app_theme/app_theme_light.dart';
import 'package:easy_localization/easy_localization.dart';

Future<void> main() async {
  await _init();
  runApp(
    EasyLocalization(
      supportedLocales: LanguageManager.instance.supportedLocales,
      path: AppConstants.langPath,
      child: MyApp(),
    ),
  );
}

Future<void> _init() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
}

class MyApp extends StatelessWidget {
  final navigationManager = NavigationManager.instance;
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: AppConstants.appTitle,
      theme: AppThemeLight.instance.appThemeLight,
      locale: context.locale,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      routeInformationParser: navigationManager.router.routeInformationParser,
      routeInformationProvider:
          navigationManager.router.routeInformationProvider,
      routerDelegate: navigationManager.router.routerDelegate,
    );
  }
}
