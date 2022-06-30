import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'screens/splash/splash_screen.dart';
import 'style/my_style.dart';
import 'style/pallate.dart';

SharedPreferences? prefs;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Medicine Store',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Palette.kToDark,
        fontFamily: 'Montserrat',
      ),
      home: const SplashScreen(),
    );
  }
}
