import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:temp_mail/screens/sign_up_screen/sign_up_screen.dart';
import 'package:temp_mail/widgets/custom_button.dart';
import 'package:temp_mail/widgets/custom_progress.dart';
import 'package:temp_mail/widgets/password_textfield.dart';
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
                  ),
                  const SizedBox(height: 30),
                  InkWell(
                    onTap: () => Get.to(() => const SignUpScreen()),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "Don't have an account? Sign Up",
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
