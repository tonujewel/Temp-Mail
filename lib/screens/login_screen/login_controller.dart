import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:temp_mail/main.dart';
import 'package:temp_mail/models/domains_dm.dart';
import 'package:temp_mail/models/login_dm.dart';
import 'package:temp_mail/models/login_error_dm.dart';
import 'package:temp_mail/screens/home_screen/home_screen.dart';

import '../../models/sign_up_dm.dart';
import '../../networking/api_manager.dart';
import '../../networking/url.dart';
import '../../utils/appConstant.dart';

class LoginController extends GetxController {
  var isLoading = false;

  var emailTextController = TextEditingController();
  var passwordTextController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  void loginApiCall() {
    if (emailTextController.text.isEmpty) {
      errorSnackbar("Email required");
      return;
    }

    if (passwordTextController.text.isEmpty) {
      errorSnackbar("Password required");
    }

    isLoading = true;
    update();

    var headers = {'content-type': 'application/json'};

    var body = {"address": "jewel@knowledgemd.com", "password": "jewel123"};
    // var body = {
    //   "address": emailTextController.text,
    //   "password": passwordTextController.text
    // };

    APIManager.postAPICall(url: URL.loginUrl, body: body, header: headers).then(
      (response) {
        isLoading = false;
        update();
        if (response != null) {
          LoginDm loginDm = loginDmFromJson(response);
          prefs!.setString(AppConstant.tokenKey, "${loginDm.token}");
          prefs!.setString(AppConstant.userIdKey, "${loginDm.token}");
          Get.offAll(() => const HomeScreen());
          update();
        }
      },
      onError: (error) {
        isLoading = false;
        update();
        LoginErrorDm loginErrorDm = loginErrorDmFromJson(error.toString());
        errorSnackbar("${loginErrorDm.message}");
      },
    );
  }
}
