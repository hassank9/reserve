import 'package:reserve/controller/auth/verfiycodesignup_controller.dart';
import 'package:reserve/core/class/statusrequest.dart';
import 'package:reserve/core/constant/color.dart';
import 'package:reserve/view/widget/auth/customtextbodyauth.dart';
import 'package:reserve/view/widget/auth/customtexttitleauth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

import '../../../core/class/crud.dart';
import '../../../core/class/handlingdataview.dart';

class VerfiyCodeSignUp extends StatelessWidget {
  const VerfiyCodeSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => Crud());
    VerifyCodeSignUpControllerImp controller =
        Get.put(VerifyCodeSignUpControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0.0,
        title: Text('Verification Code',
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(color: AppColor.grey)),
      ),
      body:GetBuilder<VerifyCodeSignUpControllerImp>(builder: (controller) =>
        controller.statusRequest == StatusRequest.loading ?
            Center(child: Text("Loading... "),)
          : Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
              child: ListView(children: [
                const SizedBox(height: 20),
                const CustomTextTitleAuth(text: "Check code"),
                const SizedBox(height: 10),
                CustomTextBodyAuth(
                    text: "Please Enter The Digit Code Sent To ${controller.email}"),
                const SizedBox(height: 15),
                OtpTextField(
                  fieldWidth: 50.0,
                  borderRadius: BorderRadius.circular(20),
                  numberOfFields: 5,
                  borderColor: const Color(0xFF512DA8),
                  //set to true to show as box or false to show as dash
                  showFieldAsBox: true,
                  //runs when a code is typed in
                  onCodeChanged: (String code) {
                    //handle validation or checks here
                  },
                  //runs when every textfield is filled
                  onSubmit: (String verificationCode) {
                    controller.goToSuccessSignUp(verificationCode);
                  }, // end onSubmit
                ),
                const SizedBox(height: 40),
                InkWell(
                  onTap: (){
                    controller.reSend();
                  },
                  child: const Center(child: Text("Resend Verfiy code",style: TextStyle(color: AppColor.primaryColor,fontSize: 20),)),
                )
              ]),
            ),
      )
    );
  }
}
