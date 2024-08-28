import 'package:reserve/core/constant/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/class/handingdatacontroller.dart';
import '../../core/class/statusrequest.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/auth/login.dart';

abstract class LoginController extends GetxController {
  login();
  goToSignUp();
  goToForgetPassword();
}

class LoginControllerImp extends LoginController {

  LoginData loginData = LoginData(Get.find());

  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController email;
  late TextEditingController password;

  bool isshowpassword = true;

  MyServices myServices = Get.find();

  StatusRequest? statusRequest;

  showPassword() {
    isshowpassword = isshowpassword == true ? false : true;
    update();
  }

  @override
  login() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await loginData.postdata(
          password.text, email.text
      );
      print("=============================== Controller $response ");
      statusRequest = handlingData(response);
      print(statusRequest);
      if (StatusRequest.success == statusRequest) {
        if (response['statusCode'] == 200) {
          // data.addAll(response['data']);
          if(response['users_approve'] == "1" ) {
            myServices.sharedPreferences.setString(
                "id", response['id'].toString());
            myServices.sharedPreferences.setString(
                "username", response['username']);
            myServices.sharedPreferences.setString("email", response['email']);
            myServices.sharedPreferences.setString("phone", response['phone']);
            myServices.sharedPreferences.setString("step", "2");
            Get.offNamed(AppRoute.homepage, arguments: {"email": email.text});
          }else{
            Get.toNamed(AppRoute.verfiyCodeSignUp,arguments: {"email":email.text});
          }
        } else {
          Get.defaultDialog(title: "ُWarning" , middleText: "Email Or Password Not Correct") ;
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {}
  }

  @override
  goToSignUp() {
    Get.offNamed(AppRoute.signUp);
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  goToForgetPassword() {
    Get.toNamed(AppRoute.forgetPassword);
  }
}
