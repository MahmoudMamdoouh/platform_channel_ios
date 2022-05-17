import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:platform_channal_ios/app/modules/second/views/second_view.dart';
import '../Widgets/change_theme_icon.dart';
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
              ChangeThemeIcon(),
            ],
          ),
          body: Center(
            child: ElevatedButton(
              onPressed: () {
                Get.to(() => SecondView());
              },
              child: Text('GOOO!!'),
            ),
            // Text(
            //   controller.chargingStatus,
            //   style: TextStyle(fontSize: 20),
            // ),
          ),
        );
      }),
    );
  }
}
