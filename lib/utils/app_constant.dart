import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AppConstant {
  //......... Share preference .........//

  static const String tokenKey = "Token";
  static const String userIdKey = "UserIdKey";

  static String databaseName="TempEmail";

  static getFormatedDate(date) {
    var inputFormat = DateFormat('yyyy-MM-dd HH:mm');
    var inputDate = inputFormat.parse(date.toString());
    var outputFormat = DateFormat('dd MMM, yyyy hh:mm a');
    return outputFormat.format(inputDate);
  }


    static void customDialog(
      {required BuildContext context,
      required String title,
      required String middleText,
      required Function() confirmAction,
      String? confirmButtonText}) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: Text(title),
          content: Text(middleText),
          actions: <Widget>[
             TextButton(
              child:  const Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
             TextButton(
              onPressed: confirmAction,
              child:  Text(confirmButtonText ?? "Yes"),
            ),
          ],
        );
      },
    );
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
