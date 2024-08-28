import 'package:reserve/core/constant/routes.dart';
import 'package:get/get.dart';

import '../../core/class/handingdatacontroller.dart';
import '../../core/class/statusrequest.dart';
import '../../data/datasource/remote/auth/verfiycodesignup.dart';

abstract class VerifyCodeSignUpController extends GetxController {
  checkCode();
  goToSuccessSignUp(String verificationCode);
}

class VerifyCodeSignUpControllerImp extends VerifyCodeSignUpController {

  VerfiyCodeSignUpData verfiyCodeSignUpData = VerfiyCodeSignUpData(Get.find());

  String? email;
  StatusRequest? statusRequest ;



  @override
  checkCode() {}

  @override
  goToSuccessSignUp(verificationCode)  async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await verfiyCodeSignUpData.postdata(email!, verificationCode);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['statusCode'] == 200) {
        Get.offNamed(AppRoute.successSignUp);
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

  reSend(){
    verfiyCodeSignUpData.resendData(email!);
  }

}
