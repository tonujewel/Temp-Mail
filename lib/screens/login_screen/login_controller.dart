import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:temp_mail/main.dart';
import 'package:temp_mail/models/login_dm.dart';
import 'package:temp_mail/models/login_error_dm.dart';
import 'package:temp_mail/screens/home_screen/home_screen.dart';
import '../../networking/api_manager.dart';
import '../../networking/url.dart';
import '../../utils/app_constant.dart';

class LoginController extends GetxController {
  var isLoading = false;

  var emailTextController = TextEditingController();
  var passwordTextController = TextEditingController();

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
        print(error.toString());

        if (error.toString().contains("_no_internet")) {
          errorSnackbar("No Internet");
          return;
        }
        LoginErrorDm loginErrorDm = loginErrorDmFromJson(error.toString());
        errorSnackbar("${loginErrorDm.message}");
      },
    );
  }
}
