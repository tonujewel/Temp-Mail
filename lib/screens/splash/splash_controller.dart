import 'dart:async';
import 'package:get/get.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:temp_mail/screens/home_screen/home_screen.dart';
import 'package:temp_mail/screens/sign_up_screen/sign_up_screen.dart';
import '../../main.dart';
import '../../utils/app_constant.dart';

class SplashController extends GetxController {
  @override
  void onInit() async {
    // shared preference init for global use
    prefs = await SharedPreferences.getInstance();

    if (prefs?.getString(AppConstant.tokenKey) == null) {
      Timer(const Duration(seconds: 3), () => Get.off(() => const SignUpScreen()));
    } else {
      Timer(const Duration(seconds: 3), () => Get.off(() => const HomeScreen()));
    }

    super.onInit();
  }
}
