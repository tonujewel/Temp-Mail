import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:temp_mail/main.dart';
import 'package:temp_mail/models/email_dm.dart';
import 'package:temp_mail/models/home_hive_dm.dart';
import 'package:temp_mail/screens/login_screen/login_screen.dart';

import '../../networking/api_manager.dart';
import '../../networking/url.dart';
import '../../utils/app_constant.dart';

class HomeController extends GetxController {
  var isLoading = false;
  bool noInternet = false;

  List<HomeHiveDm> emailList = [];

  final hiveBox = Hive.box(AppConstant.databaseName);

  @override
  void onInit() {
    getLocalData();
    checkInternet();
    super.onInit();
  }

  void getLocalData() async {
    emailList.clear();
    for (var item in hiveBox.keys.toList()) {
      emailList.add(hiveBox.get(item));
      update();
    }
  }

  void checkInternet() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      if (emailList.isEmpty) {
        noInternet = true;
        update();
      } else {
        noInternet = false;
        update();
      }
    } else {
      getEmail();
    }
    update();
  }

  void getEmail() {
    isLoading = true;
    update();

    var headers = {
      'content-type': 'application/json',
      'Authorization': 'Bearer ${prefs!.getString(AppConstant.tokenKey)}',
    };

    APIManager.getAPICall(url: URL.emailUrl, header: headers).then(
      (response) {
        isLoading = false;
        update();
        if (response != null) {
          EmailDm emailDm = emailDmFromJson(response);

          for (var i = 0; i < emailDm.hydraMember!.length; i++) {
            var data = HomeHiveDm(
              name: "${emailDm.hydraMember![i].from!.name}",
              body: "${emailDm.hydraMember![i].intro}",
              email: "${emailDm.hydraMember![i].from!.address}",
              subject: "${emailDm.hydraMember![i].subject}",
              id: "${emailDm.hydraMember![i].id}",
              createdAt: "${emailDm.hydraMember![i].createdAt}",
            );

            if (!isExist(data)) {
              hiveBox.add(data);
            }
          }
          getLocalData();

          update();
        }
      },
      onError: (error) {
        isLoading = false;
        update();
        errorSnackbar(error.toString());
      },
    );
  }

  bool isExist(HomeHiveDm data) {
    final result = emailList;
    // ignore: prefer_is_empty
    return result.length >= 0
        ? result.any((HomeHiveDm item) => item.id == data.id)
        : false;
  }

  void logoutAction(BuildContext context) {
    AppConstant.customDialog(
        context: context,
        title: "Log out!",
        middleText: "Are you sure want to logout",
        confirmAction: () async {
          await prefs!.clear();
          Hive.box(AppConstant.databaseName).clear();
          Get.offAll(() => const LoginScreen());
        });
    return;
  }
}
