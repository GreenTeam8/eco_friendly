import 'package:eco_friendly/constants.dart';
import 'package:get/get.dart';

import '/view/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Eco-Friendly',
      debugShowCheckedModeBanner: false,
      theme:
      ThemeData(
        fontFamily: 'Poppins',
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.green).copyWith(secondary: Colors.lightGreenAccent),
        textTheme: ThemeData.light().textTheme.copyWith(
          bodyText1: const TextStyle(color: kPrimaryColor, fontSize: 35, fontFamily: 'LilitaOne',fontWeight: FontWeight.bold),
          bodyText2: const TextStyle(color: Colors.black,fontFamily: 'Poppins'),
        ),

      ),

      home: SplashScreen(),
    );
  }
}

