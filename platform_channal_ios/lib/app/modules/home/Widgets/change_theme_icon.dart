import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class ChangeThemeIcon extends GetView<HomeController> {
  //*================================ Parameters ===============================
  //*===========================================================================
  //*================================ Constructor ==============================
  const ChangeThemeIcon({
    Key? key,
  }) : super(key: key);
  //*===========================================================================
  //*================================= Methods =================================
  @override
  Widget build(BuildContext context) {
    //*============================== Parameters ===============================
    final int switchingTime = 400;
    //*=========================================================================
    return ThemeSwitcher(
      builder: (p0) {
        return IconButton(
          icon: AnimatedSwitcher(
            duration: Duration(milliseconds: switchingTime),
            child: controller.isDark
                ? Icon(
                    Icons.light_mode,
                    key: UniqueKey(),
                  )
                : Icon(
                    Icons.dark_mode,
                    key: UniqueKey(),
                  ),
          ),
          onPressed: () => controller.onChangeTheme(p0),
        );
      },
    );
  }
  //*===========================================================================
}
