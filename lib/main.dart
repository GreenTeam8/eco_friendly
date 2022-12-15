
import 'package:eco_friendly/controller/products_controller.dart';
import 'package:eco_friendly/view/favorites/favorites_screen.dart';
import 'package:eco_friendly/view/products/product_detail_widget.dart';
import 'package:eco_friendly/view/products/products_screen.dart';
import 'package:eco_friendly/view/root_screen/root_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '/view/splash_screen/splash_screen.dart';
import '../../zhelpers/constants.dart';
import '../../zhelpers/responsive.dart';
import 'controller/category_controller.dart';
import 'firebase_options.dart';
import 'zhelpers/horizontal_scroll_helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((value) => print("connected " + value.options.asMap.toString()))
   .catchError((e) => print(e.toString()));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CategoryController(),),
        ChangeNotifierProvider(
          create: (context) => ProductController(),),
      ],
        child: GetMaterialApp(
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
                          color: Colors.black, fontFamily: 'Poppins', fontSize: 18,),
                    ),
                appBarTheme: const AppBarTheme(
                  backgroundColor: Colors.white,
                  elevation: 0,
                )),
            home: Responsive.checkPlatform() ? RootScreen() : SplashScreen(),
            routes: {
              ProductsScreen.PRODUCTS_ROUTE_NAME: (context)=> ProductsScreen(),
              ProductDetailsWidget.PRODUCTS_DETAILS_ROUTE_NAME: (context) => ProductDetailsWidget(),

            },
            ),

    );
  }
}
