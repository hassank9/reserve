import 'package:reserve/core/constant/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/class/handingdatacontroller.dart';
import '../../core/class/statusrequest.dart';
import '../../data/datasource/remote/auth/verfiycodesignup.dart';
import '../../data/datasource/remote/forgetpassword/verifycodeforget.dart';

abstract class VerifyCodeController extends GetxController {
  checkCode();
  goToResetPassword(String verifyCode);
}

class VerifyCodeControllerImp extends VerifyCodeController {

  String? email;

  VerifyCodeForgetpasswordData verifyCodeForgetpasswordData = VerifyCodeForgetpasswordData(Get.find());

  StatusRequest? statusRequest;

  @override
  checkCode() {}

  @override
  goToResetPassword(verifyCode) async {

    statusRequest = StatusRequest.loading;
    update();
    var response = await verifyCodeForgetpasswordData.postdata(email!, verifyCode);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['statusCode'] == 200) {
        Get.offNamed(AppRoute.resetPassword,arguments: {"email":email});
      } else {
        Get.defaultDialog(title: "ُWarning" , middleText: "Verify Code Not Correc") ;
        statusRequest = StatusRequest.failure;
      }
    }
    update();

  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }


}