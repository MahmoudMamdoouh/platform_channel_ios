import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/data/custom_theme.dart';
import 'app/routes/app_pages.dart';

void main() {
  runApp(
    ThemeProvider(
        initTheme: CustomTheme.lightThemeData,
        builder: (context, myTheme) {
          return GetMaterialApp(
            title: "Application",
            initialRoute: AppPages.INITIAL,
            getPages: AppPages.routes,
            theme: CustomTheme.lightThemeData,
            darkTheme: CustomTheme.darkThemeData,
          );
        }),
  );
}
