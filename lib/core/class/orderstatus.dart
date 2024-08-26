import 'package:flutter/material.dart';
import '../constant/color.dart';

class OrderStatus {
  static const String waiting = "on hold";
  static const String archived = "archived";
  static const String prepare = "in preparation";
  static const String way = "in way";
  static const String store = "in store";

  // ignore: body_might_complete_normally_nullable
  static Color? getColorOrder(String status) {
    switch (status) {
      case OrderStatus.archived:
        return AppColor.grey;
      case OrderStatus.way:
        return AppColor.green;
      case OrderStatus.prepare:
        return AppColor.orange;
      case OrderStatus.waiting:
        return AppColor.red;
      case OrderStatus.store:
        return AppColor.blueGrey;
    }
  }
}
