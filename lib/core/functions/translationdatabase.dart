import 'package:get/get.dart';

import '../services/services.dart';

String translationDataBase(String textArabic, String textEnglish) {
  MyServices myServices = Get.find();
  String language = myServices.sharedPreferences.getString('language')!;
  if (language == "en") {
    return textEnglish;
  } else if (language == "ar") {
    return textArabic;
  }
  return textEnglish;
}
