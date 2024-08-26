import 'package:get/get.dart';

validInputAddress(String val, int min, int max) {
  if (val.isEmpty) {
    return "46".tr;
  }

  if (val.length > max) {
    return "${"51".tr} $max";
  }

  if (val.length < min) {
    return "${"47".tr} $min";
  }
}
