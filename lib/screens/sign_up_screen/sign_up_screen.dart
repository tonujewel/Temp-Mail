

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../style/my_style.dart';
import '../../widgets/custom_progress.dart';
import 'sign_up_controller.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpController>(
        init: SignUpController(),
        builder: (controller) {
          return CustomProgress(
            isLoading: controller.isLoading,
            child: Scaffold(
              backgroundColor: Colors.white,
              body: ListView(
                padding: const EdgeInsets.all(15.0),
                children: [
                  SizedBox(height: Get.height * 0.03),
                  Image.asset(
                    'assets/images/logo.png',
                    // height: Get.height * .15,
                    width: Get.width * .8,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Username",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                      suffix: Text(
                        "@${controller.domainName}",
                        style: const TextStyle(color: Style.primaryColor),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        primary: Style.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        elevation: 15.0,
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Text(
                          'Submit',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
