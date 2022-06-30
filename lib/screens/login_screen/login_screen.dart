import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:temp_mail/style/my_style.dart';
import 'package:temp_mail/widgets/custom_button.dart';
import 'package:temp_mail/widgets/custom_progress.dart';
import 'package:temp_mail/widgets/password_textField.dart';

import 'login_controller.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
        init: LoginController(),
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
                    controller: controller.emailTextController,
                    decoration: InputDecoration(
                      hintText: "Email",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                    ),
                  ),
                  const SizedBox(height: 20),
                  PasswordTextField(
                      controller: controller.passwordTextController),
                  const SizedBox(height: 30),
                  CustomButton(
                    onTap: () => controller.loginApiCall(),
                    text: "Login",
                  )
                ],
              ),
            ),
          );
        });
  }
}
