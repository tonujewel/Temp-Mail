import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'splash_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
        init: SplashController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: Get.height * 0.03),
                  TweenAnimationBuilder<double>(
                    duration: const Duration(milliseconds: 3000),
                    tween: Tween(begin: 100.0,end: 400.0),
                      builder: (context, value, child) {
                        return Image.asset(
                          'assets/images/logo.png',
                          height: value,
                          width: value,
                        );
                      })
                ],
              ),
            ),
          );
        });
  }
}
