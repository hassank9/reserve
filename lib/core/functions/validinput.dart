import 'package:get/get.dart';

validInput(String val, int min, int max, String type) {
  if (val.isEmpty) {
    return "46".tr;
  }

  if (val.length > max) {
    return "${"51".tr} $max";
  }

  if (val.length < min) {
    return "${"47".tr} $min";
  }

  if (type == "username") {
    if (!GetUtils.isUsername(val)) {
      return "52".tr;
    }
  }

  if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return "48".tr;
    }
  }

  if (type == "phone") {
    if (!GetUtils.isPhoneNumber(val)) {
      return "49".tr;
    }
  }

  if (type == "password") {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = RegExp(pattern);
    if (!regExp.hasMatch(val)) {
      return "50".tr;
    }
  }
}
