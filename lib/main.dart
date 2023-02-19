
import 'package:eco_friendly/controller/authentication_controller.dart';
import 'package:eco_friendly/controller/carousel_controller.dart';
import 'package:eco_friendly/controller/cart_controller.dart';
import 'package:eco_friendly/controller/climate_change_controller.dart';
import 'package:eco_friendly/controller/orders_controller.dart';
import 'package:eco_friendly/controller/products_controller.dart';
import 'package:eco_friendly/view/drawer/mobile/climate_change_details_mobile.dart';
import 'package:eco_friendly/view/favorites/favorites_screen.dart';
import 'package:eco_friendly/view/products/product_detail_widget.dart';
import 'package:eco_friendly/view/products/products_screen.dart';
import 'package:eco_friendly/view/profile/register_screen.dart';
import 'package:eco_friendly/view/profile/user_profile_screen.dart';
import 'package:eco_friendly/view/root_screen/root_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '/view/splash_screen/splash_screen.dart';
import '../../helpers/constants.dart';
import '../../helpers/responsive.dart';
import 'controller/category_controller.dart';
import 'firebase_options.dart';
import 'model/product.dart';
import 'helpers/horizontal_scroll_helper.dart';

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
          create: (context) => CarousellController(),),
        ChangeNotifierProvider(
          create: (context) => CategoryController(),),
        // ChangeNotifierProvider(
        //   create: (context) => ProductController(),),
        ChangeNotifierProvider(
          create: (context) => AuthenticationController(),),

        ChangeNotifierProxyProvider<AuthenticationController, ProductController>(
          create: (context) => ProductController('','', []),
          update: (context, auth, previousProducts) {
            return ProductController(auth.token, auth.userId, previousProducts == null ? [] : previousProducts.getProductsList);
          },
        ),
        ChangeNotifierProvider(
          create: (context) => CartController(),),
        ChangeNotifierProxyProvider<AuthenticationController, OrdersController>(
          create: (context) => OrdersController('','', []),
          update: (context, auth, previousOrders) {
            return OrdersController(auth.token!, auth.userId!,previousOrders == null ? [] : previousOrders.orders);
          },
        ),
        ChangeNotifierProvider(
          create: (context) => Product(),),
        ChangeNotifierProvider(
          create: (context) => ClimateChangeController(),),
      ],
        child: GetMaterialApp(
            title: 'Eco-Friendly',
            debugShowCheckedModeBanner: false,
            scrollBehavior: MyCustomScrollBehavior(),
            theme: ThemeData(
                fontFamily: 'Poppins',
                primaryColor: mColor,
                //canvasColor: mmColor,
                //colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.green).copyWith(secondary: Colors.lightGreenAccent),
                textTheme: ThemeData.light().textTheme.copyWith(
                      bodyText1: const TextStyle(
                          color: mainColor,
                          fontSize: 25,
                          fontFamily: 'LilitaOne',
                          letterSpacing: 1.2,
                          fontWeight: FontWeight.bold),
                      bodyText2: TextStyle(
                          color: Colors.grey[700], fontFamily: 'Poppins', fontSize: 16,),
                    ),
                appBarTheme: const AppBarTheme(
                  backgroundColor: Colors.white,
                  elevation: 0,
                )),
            home: Responsive.checkPlatform() ? RootScreen() : SplashScreen(),
            routes: {
              ProductsScreen.PRODUCTS_ROUTE_NAME: (context)=> ProductsScreen(),
              ProductDetailsWidget.PRODUCTS_DETAILS_ROUTE_NAME: (context) => ProductDetailsWidget(),
              UserProfileScreen.USERPROFILESCREEN_ROUTE_NAME: (context) => UserProfileScreen(),
              RegisterScreen.REGISTERSCREEN_ROUTE_NAME: (context) => RegisterScreen(),
              ClimateChangeDetail.CLIMATE_DETAILS_ROUTE_NAME:(context)=>ClimateChangeDetail(),
            },
            ),

    );
  }
}
