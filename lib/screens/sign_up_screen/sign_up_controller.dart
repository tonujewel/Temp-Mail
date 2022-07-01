import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:temp_mail/models/domains_dm.dart';
import 'package:temp_mail/models/sign_up_dm.dart';
import 'package:temp_mail/models/sign_up_error_dm.dart';
import 'package:temp_mail/screens/login_screen/login_screen.dart';
import 'package:temp_mail/utils/app_constant.dart';
import '../../networking/api_manager.dart';
import '../../networking/url.dart';

class SignUpController extends GetxController {
  var isLoading = false;

  String domainName = '';

  var userNameTextController = TextEditingController();
  var passwordTextController = TextEditingController();

  @override
  void onInit() {
    getDomains();
    super.onInit();
  }

  void getDomains() {
    isLoading = true;
    update();

    APIManager.getAPICall(url: URL.domainsUrl).then(
      (response) {
        isLoading = false;
        update();
        if (response != null) {
          DomainDm domainDm = domainDmFromJson(response);

          if (domainDm.hydraMember!.isNotEmpty) {
            domainName = "${domainDm.hydraMember![0].domain}";
          }

          update();
        }
      },
      onError: (error) {
        isLoading = false;
        update();
        if (error.toString().contains("_no_internet")) {
          errorSnackbar("No Internet");
          return;
        }
        errorSnackbar(error.toString());
      },
    );
  }

  void signUpApiCall() {
    if (userNameTextController.text.isEmpty) {
      errorSnackbar("Username required");
      return;
    }

    if (passwordTextController.text.isEmpty) {
      errorSnackbar("Password required");
    }

    isLoading = true;
    update();

    var headers = {'content-type': 'application/json'};

    var body = {
      "address": "${userNameTextController.text}@$domainName",
      "password": passwordTextController.text
    };

    APIManager.postAPICall(url: URL.registerUrl, body: body, header: headers)
        .then(
      (response) {
        isLoading = false;
        update();
        if (response != null) {
          SignUpDm signUpDm = signUpDmFromJson(response);
          successSnackbar("${signUpDm.address} created, Please login");
          Get.off(() => const LoginScreen());
          update();
        }
      },
      onError: (error) {
        isLoading = false;
        update();
        if (error.toString().contains("_no_internet")) {
          errorSnackbar("No Internet");
          return;
        }
        SignUpErrorDm signUpErrorDm = signUpErrorDmFromJson(error.toString());
        errorSnackbar("${signUpErrorDm.hydraDescription}");
      },
    );
  }
}
