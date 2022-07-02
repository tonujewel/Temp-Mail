import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NoMailWidget extends StatelessWidget {
  const NoMailWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        height: Get.height,
        width: Get.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/no_mail.png',
              height: Get.height * .2,
            ),
            const SizedBox(height: 20),
            const Text(
              "No Mail",
              style: TextStyle(fontSize: 24, fontStyle: FontStyle.italic),
            )
          ],
        ));
  }
}
