import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:temp_mail/screens/login_screen/login_screen.dart';
import 'package:temp_mail/widgets/password_textfield.dart';

import '../../style/my_style.dart';
import '../../widgets/custom_button.dart';
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
                  Image.asset('assets/images/logo.png'),
                  TextField(
                    controller: controller.userNameTextController,
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
                  const SizedBox(height: 20),
                  PasswordTextField(
                    controller: controller.passwordTextController,
                  ),
                  const SizedBox(height: 30),
                  CustomButton(
                    text: "Sign Up",
                    onTap: () => controller.signUpApiCall(),
                  ),
                  const SizedBox(height: 30),
                  InkWell(
                    onTap: () => Get.to(() => const LoginScreen()),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "Already have an account? Sign In",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
