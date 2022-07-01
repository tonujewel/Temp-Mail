import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:temp_mail/models/home_hive_dm.dart';
import 'screens/splash/splash_screen.dart';
import 'style/pallate.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'utils/app_constant.dart';

SharedPreferences? prefs;

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(HomeHiveDmAdapter());
    await Hive.openBox(AppConstant.databaseName);
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
