import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mc_crud_test/config/theme_data.dart';
import 'package:mc_crud_test/main.dart';

class DesignConfig {
  static BuildContext? get context => navigatorKey.currentContext;

  static const BorderRadius lowBorderRadius = BorderRadius.all(
    Radius.circular(8),
  );
  static const BorderRadius mediumBorderRadius = BorderRadius.all(
    Radius.circular(10),
  );
  static const BorderRadius highBorderRadius = BorderRadius.all(
    Radius.circular(16),
  );

  static Border get cardBorder => Border.all(
        color: Theme.of(context!).colorScheme.cardBorder,
        width: 0.5,
      );

  static List<BoxShadow> get defaultShadow => [
        BoxShadow(
          color: const Color(0XFF1B3C59).withOpacity(0.25),
          blurRadius: 16,
          spreadRadius: 0,
        )
      ];

  static const Duration lowAnimationDuration = Duration(milliseconds: 300);
  static const Duration mediumAnimationDuration = Duration(milliseconds: 400);

  static SystemUiOverlayStyle get systemUiOverlayStyle => SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarColor:
            Theme.of(context!).colorScheme.background.withOpacity(0.5),
        systemNavigationBarColor: Theme.of(context!).colorScheme.surface,
        systemNavigationBarDividerColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.dark,
      );

  static void updateSystemUiOverlayStyle() {
    Future.delayed(
      const Duration(milliseconds: 300),
      () => SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle),
    );
  }
}
