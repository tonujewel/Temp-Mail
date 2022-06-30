import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AppConstant {
  //......... Share preference .........//

  static const String tokenKey = "Token";

  static getFormatedDate(date) {
    var inputFormat = DateFormat('yyyy-MM-dd HH:mm');
    var inputDate = inputFormat.parse(date.toString());
    var outputFormat = DateFormat('dd MMM, yyyy hh:mm a');
    return outputFormat.format(inputDate);
  }

  static getFormatedDateOnly(date) {
    var inputFormat = DateFormat('yyyy-MM-dd HH:mm');
    var inputDate = inputFormat.parse(date.toString());
    var outputFormat = DateFormat('dd MMM, yyyy ');
    return outputFormat.format(inputDate);
  }

  static getFormatedTime(date) {
    var inputFormat = DateFormat('yyyy-MM-dd HH:mm');
    var inputDate = inputFormat.parse(date.toString());
    var outputFormat = DateFormat('HH:mm');
    return outputFormat.format(inputDate);
  }

  static void hideKeyword(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      currentFocus.focusedChild?.unfocus();
    }
  }

  static String discountCalculation(
      {required String price, required String discountPrice}) {
    double result = double.parse(price) - double.parse(discountPrice);
    return result.toString();
  }
}

SnackbarController errorSnackbar(String msg) {
  return Get.snackbar('Error', msg,
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.red,
      colorText: Colors.white);
}

SnackbarController successSnackbar(String msg) {
  return Get.snackbar('Success', msg,
      snackPosition: SnackPosition.TOP, backgroundColor: Colors.green[70]);
}
