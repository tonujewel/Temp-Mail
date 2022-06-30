import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AppConstant {
  //......... Share preference .........//

  static const String tokenKey = "Token";
  static const String userIdKey = "UserIdKey";

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

  static String convertToAgo(String dateTime) {
    DateTime input = DateFormat('yyyy-MM-dd HH:mm').parse(dateTime, true);
    Duration diff = DateTime.now().difference(input);

    if (diff.inDays >= 1) {
      return '${diff.inDays} day${diff.inDays == 1 ? '' : 's'} ago';
    } else if (diff.inHours >= 1) {
      return '${diff.inHours} hour${diff.inHours == 1 ? '' : 's'} ago';
    } else if (diff.inMinutes >= 1) {
      return '${diff.inMinutes} minute${diff.inMinutes == 1 ? '' : 's'} ago';
    } else if (diff.inSeconds >= 1) {
      return '${diff.inSeconds} second${diff.inSeconds == 1 ? '' : 's'} ago';
    } else {
      return 'just now';
    }
  }
}

SnackbarController errorSnackbar(String msg) {
  return Get.snackbar('Error', msg,
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.red,
      colorText: Colors.white);
}

SnackbarController successSnackbar(String msg) {
  return Get.snackbar(
    'Success',
    msg,
    colorText: Colors.white,
    snackPosition: SnackPosition.TOP,
    backgroundColor: Colors.black,
  );
}
