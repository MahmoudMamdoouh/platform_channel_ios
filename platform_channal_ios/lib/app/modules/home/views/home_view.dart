import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:platform_channal_ios/app/data/theme.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return ThemeSwitchingArea(
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: Text('HomeView'),
            centerTitle: true,
            actions: [
              ThemeSwitcher(
                builder: (p0) {
                  return IconButton(
                    icon: controller.isDark
                        ? Icon(Icons.light_mode)
                        : Icon(Icons.dark_mode),
                    onPressed: () {
                      print(controller.isDark);
                      ThemeSwitcher.of(p0).changeTheme(
                          theme: controller.isDark
                              ? CustomTheme.lightThemeData
                              : CustomTheme.darkThemeData,
                          isReversed: true // default: false
                          );
                      controller.isDark = !controller.isDark;
                    },
                  );
                },
              ),
            ],
          ),
          body: Center(
            child: Text(
              'HomeView is working',
              style: TextStyle(fontSize: 20),
            ),
          ),
        );
      }),
    );
  }
}
