import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  //variable
  RxBool isDark = false.obs;

  void changeTheme() {
    isDark.value = !isDark.value;
    Get.changeThemeMode(isDark.isTrue ? ThemeMode.dark : ThemeMode.light);
  }
}
