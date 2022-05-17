import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../data/custom_theme.dart';

class HomeController extends GetxController {
//!===========================================================================
//!=========================== Controller Methods ============================
  @override
  void onInit() {
    super.onInit();
    eventChannel.receiveBroadcastStream().listen(_onEvent, onError: _onError);
  }

//!===========================================================================
//!=============================== Properties ================================
  static const MethodChannel methodChannel =
      MethodChannel('samples.flutter.io/battery');

  static const EventChannel eventChannel =
      EventChannel('samples.flutter.io/charging');

  final _isDark = false.obs;
  final _batteryLevel = 'Battery level: unknown.'.obs;
  final _chargingStatus = 'Battery status: unknown.'.obs;
//!===========================================================================
//!============================ Getters/Setters ==============================
  bool get isDark => _isDark.value;
  set isDark(bool newValue) => _isDark.value = newValue;

  String get batteryLevel => _batteryLevel.value;
  set batteryLevel(String newValue) => _batteryLevel.value = newValue;

  String get chargingStatus => _chargingStatus.value;
  set chargingStatus(String newValue) => _chargingStatus.value = newValue;
//!===========================================================================
//!================================ Methods ==================================

  Future<void> getBatteryLevel() async {
    String newBatteryLevel;
    try {
      final int? result = await methodChannel.invokeMethod('getBatteryLevel');
      newBatteryLevel = 'Battery level: $result%.';
    } on PlatformException {
      newBatteryLevel = 'Failed to get battery level.';
    }

    batteryLevel = newBatteryLevel;
  }

  void _onEvent(Object? event) {
    chargingStatus =
        "Battery status: ${event == 'charging' ? '' : 'dis'}charging.";
  }

  void _onError(Object error) {
    chargingStatus = 'Battery status: unknown.';
  }

  void onChangeTheme(context) {
    ThemeSwitcher.of(context).changeTheme(
      theme: isDark ? CustomTheme.lightThemeData : CustomTheme.darkThemeData,
    );
    isDark = !isDark;
  }
//!===========================================================================
}
