import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';


import '/view/splash_screen/splash_screen.dart';
import '/horizontal_scroll_helper.dart';
import '/constants.dart';
import 'view/Home/home_screen.dart';
import '/responsive.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Eco-Friendly',
        debugShowCheckedModeBanner: false,
        scrollBehavior: MyCustomScrollBehavior(),
        theme: ThemeData(
            fontFamily: 'Poppins',
            primaryColor: kPC,
            //colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.green).copyWith(secondary: Colors.lightGreenAccent),
            textTheme: ThemeData.light().textTheme.copyWith(
                  bodyText1: const TextStyle(
                      color: kPC,
                      fontSize: 35,
                      fontFamily: 'LilitaOne',
                      fontWeight: FontWeight.bold),
                  bodyText2: const TextStyle(
                      color: Colors.black, fontFamily: 'Poppins', fontSize: 16),
                ),
            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.white,
              elevation: 0,
            )),
        home: Builder(
            builder: (context) {
             return Responsive.isWeb(context) ? HomeScreen() : SplashScreen();
            },
        ));
  }
}
