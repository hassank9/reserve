import 'package:reserve/core/constant/routes.dart';
import 'package:reserve/core/middleware/mymiddleware.dart';
import 'package:reserve/view/screen/auth/forgetpassword/forgetpassword.dart';
import 'package:reserve/view/screen/auth/login.dart';
import 'package:reserve/view/screen/auth/forgetpassword/resetpassword.dart';
import 'package:reserve/view/screen/auth/signup.dart';
import 'package:reserve/view/screen/auth/forgetpassword/success_resetpassword.dart';
import 'package:reserve/view/screen/auth/success_signup.dart';
import 'package:reserve/view/screen/auth/forgetpassword/verifycode.dart';
import 'package:reserve/view/screen/auth/verifycodesignup.dart';
import 'package:reserve/view/screen/homePage.dart';
import 'package:reserve/view/screen/language.dart';
import 'package:reserve/view/screen/onboarding.dart';
import 'package:get/get.dart';
import 'package:reserve/view/test_view.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(name: "/", page: () => const Language() , middlewares: [
    MyMiddleWare()
  ]),
  // GetPage(name: "/", page: () =>  TestView()),
  GetPage(name: AppRoute.login, page: () => const Login()),
  GetPage(name: AppRoute.signUp, page: () => const SignUp()),
  GetPage(name: AppRoute.forgetPassword, page: () => const ForgetPassword()),
  GetPage(name: AppRoute.verfiyCode, page: () => const VerfiyCode()),
  GetPage(name: AppRoute.resetPassword, page: () => const ResetPassword()),
  GetPage(name: AppRoute.successResetpassword, page: () => const SuccessResetPassword()),
  GetPage(name: AppRoute.successSignUp, page: () => const SuccessSignUp()),
  GetPage(name: AppRoute.onBoarding, page: () => const OnBoarding()),
  GetPage(name: AppRoute.verfiyCodeSignUp, page: () => const VerfiyCodeSignUp()),
  GetPage(name: AppRoute.homepage, page: () => const HomePage()),
];