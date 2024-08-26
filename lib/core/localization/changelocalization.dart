import 'package:reserve/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/theme.dart';

class LocalController extends GetxController {
  Locale? language;
  MyServices myServices = Get.find();
  late ThemeData appTheme;

  changeLanguage(String langCode) {
    Locale locale = Locale(langCode);
    myServices.sharedPreferences.setString('language', langCode);
    Get.updateLocale(locale);
    Get.changeTheme(appTheme);
  }

  @override
  onInit() {
    String? currentLanguage =
        myServices.sharedPreferences.getString('language');
    if (currentLanguage == "ar") {
      language = const Locale("ar");
      appTheme = AppTheme.themeArabic;
    } else if (currentLanguage == "en") {
      language = const Locale("en");
      appTheme = AppTheme.themeEnglish;
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
      appTheme = AppTheme.themeEnglish;
    }
    super.onInit();
  }
}
