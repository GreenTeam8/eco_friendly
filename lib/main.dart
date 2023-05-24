
import 'package:eco_friendly/controller/authentication_controller.dart';
import 'package:eco_friendly/controller/carousel_controller.dart';
import 'package:eco_friendly/controller/cart_controller.dart';
import 'package:eco_friendly/controller/climate_change_controller.dart';
import 'package:eco_friendly/controller/event_controller.dart';
import 'package:eco_friendly/controller/eventcategory_controller.dart';
import 'package:eco_friendly/controller/orders_controller.dart';
import 'package:eco_friendly/controller/products_controller.dart';
import 'package:eco_friendly/view/Home/home_screen.dart';
import 'package:eco_friendly/view/drawer/mobile/climate_change_details_mobile.dart';
import 'package:eco_friendly/view/cart/cart_screen.dart';
import 'package:eco_friendly/view/drawer/mobile/tacling_climate_details_mobile.dart';
import 'package:eco_friendly/view/drawer/web/climate_change_details_web.dart';
import 'package:eco_friendly/view/drawer/web/climate_change_web.dart';

import 'package:eco_friendly/view/drawer/mobile/climate_change_details_mobile.dart';
import 'package:eco_friendly/view/cart/cart_screen.dart';
import 'package:eco_friendly/view/drawer/web/tacling_climate_details_web.dart';
import 'package:eco_friendly/view/event/web/event_details_web.dart';
import 'package:eco_friendly/view/favorites/favorites_screen.dart';
import 'package:eco_friendly/view/orders/orders_screen.dart';
import 'package:eco_friendly/view/products/mobile/product_detail_mobile.dart';
import 'package:eco_friendly/view/products/products_screen.dart';
import 'package:eco_friendly/view/products/web/product_details_web.dart';
import 'package:eco_friendly/view/profile/register_screen.dart';
import 'package:eco_friendly/view/profile/user_profile_screen.dart';
import 'package:eco_friendly/view/root_screen/root_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '/view/splash_screen/splash_screen.dart';
import '../../helpers/constants.dart';
import '../../helpers/responsive.dart';
import 'controller/category_controller.dart';
import 'firebase_options.dart';
import 'model/product.dart';
import 'helpers/horizontal_scroll_helper.dart';
import 'package:eco_friendly/view/event/mobile/event_detail_mobile.dart';
import 'package:eco_friendly/view/event/events_screen.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((value) => print("connected " + value.options.asMap.toString()))
   .catchError((e) => print(e.toString()));
  runApp(MyApp());
}
// final GoRouter _router =GoRouter(
//   initialLocation: '/',
//   routes: <GoRoute>[
//     GoRoute(
//       routes: <GoRoute>[
//         GoRoute(
//           name: 'page2',
//           path: 'page2',
//           builder: (BuildContext context, GoRouterState state )=>
//           const ClimateChangeWeb(),
//         ),
//         GoRoute(
//           name: 'page3',
//           path: 'page3',
//           builder: (BuildContext context, GoRouterState state )=>
//               ClimateChangeDetailWeb(),
//         ),
//       ],
//       name: 'page1',
//       path: '/',
//       builder: (BuildContext context, GoRouterState state )=>
//           HomeScreen(),
//     ),
//   ],
// );
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
        ChangeNotifierProvider(
          create: (context) => ProductController(),),
        ChangeNotifierProvider(
          create: (context) => AuthenticationController(),),
        // ChangeNotifierProxyProvider<AuthenticationController, ProductController>(
        //   create: (context) => ProductController('','', []),
        //   update: (context, auth, previousProducts) {
        //     return ProductController(auth.token!, auth.userId!, previousProducts == null ? [] : previousProducts.getProductsList);
        //   },
        // ),
        ChangeNotifierProvider(
          create: (context) => CartController(),),
        ChangeNotifierProxyProvider<AuthenticationController, OrdersController>(
          create: (context) => OrdersController('','', []),
          update: (context, auth, previousOrders) {
            return OrdersController(auth.token!, auth.userId!,previousOrders == null ? [] : previousOrders.getOrdersList);
          },
        ),

        /*
        ChangeNotifierProxyProvider<AuthenticationController, EventController>(
          create: (context) => EventController('','', []),
          update: (context, auth, previousEvents) {
            return EventController(auth.token!, auth.userId!, previousEvents == null ? [] : previousEvents.getEventsList);
          },
        ),
         */

        ChangeNotifierProvider(
          create: (context) => EventController(),),
        ChangeNotifierProvider(
          create: (context) => ECategoryController(),),
        ChangeNotifierProvider(
          create: (context) => Product(),),
        ChangeNotifierProvider(
          create: (context) => ClimateChangeController(),),
      ],
        child: GetMaterialApp(

          // routerDelegate:_router.routerDelegate ,
          // routeInformationParser: _router.routeInformationParser,
          // routeInformationProvider: _router.routeInformationProvider,
            title: 'Eco-Friendly',
            debugShowCheckedModeBanner: false,
            scrollBehavior: MyCustomScrollBehavior(),
            theme: ThemeData(
                fontFamily: 'Poppins',
                primaryColor: mColor,
                canvasColor: bgColor,

                //colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.green).copyWith(secondary: Colors.lightGreenAccent),
                textTheme: ThemeData.light().textTheme.copyWith(
                      bodyText1: const TextStyle(
                          color: mainColor,
                          fontSize: 25,
                          //fontFamily: 'Russo One',
                          letterSpacing: 1.2,
                          fontWeight: FontWeight.bold),
                      bodyText2: TextStyle(
                          color: Colors.grey[700],
                          //fontFamily: 'Poppins',
                          fontSize: 16,),
                    ),
                appBarTheme: const AppBarTheme(
                  backgroundColor: bgColor,
                  elevation: 0,
                )),
            home: Responsive.checkPlatform() ? HomeScreen() : SplashScreen(),
            //initialRoute: '/home_Screen',
          onGenerateRoute: (settings) {
            if (settings.name == '/home_Screen') {
              return MaterialPageRoute(builder: (context) => HomeScreen());
            }
            // Handle other routes as needed
          },

          routes:{

           // initialRoute: Responsive.checkPlatform() ? RootScreen.ROOT_SCREEN_ROUTE_NAME : null,
          //  onUnknownRoute: Responsive.checkPlatform() ? (settings) => MaterialPageRoute(builder: (context) => RootScreen(),) : null,

            //  '/' : (context)=> RootScreen(),
            //'/': (context)=> HomeScreen(),
              HomeScreen.HOME_SCREEN_ROUTE_NAME: (context)=> HomeScreen(),
              ProductsScreen.PRODUCTS_ROUTE_NAME: (context)=> ProductsScreen(),
              ProductDetailsMobile.PRODUCTS_DETAILS_MOBILE_ROUTE_NAME: (context) => ProductDetailsMobile(),
              ProductDetailsWeb.PRODUCTS_DETAILS_WEB_ROUTE_NAME: (context) => ProductDetailsWeb(),
              UserProfileScreen.USERPROFILESCREEN_ROUTE_NAME: (context) => UserProfileScreen(),
              RegisterScreen.REGISTERSCREEN_ROUTE_NAME: (context) => RegisterScreen(),


              ClimateChangeDetailMobil.CLIMATE_DETAILS_MOBILE_ROUTE_NAME:(context)=>ClimateChangeDetailMobil(),
              ClimateChangeDetailWeb.CLIMATE_DETAILS_WEB_ROUTE_NAME:(context)=>ClimateChangeDetailWeb(),
              TaclingClimateChangeDetailWeb.TACLING_CLIMATE_DETAILS_WEB_ROUTE_NAME:(context)=>TaclingClimateChangeDetailWeb(),
            TaclingClimateChangeDetailMobile.TACLING_CLIMATE_DETAILS_MOBILE_ROUTE_NAME:(context)=>TaclingClimateChangeDetailMobile(),

              FavoritesScreen.FAVORITES_ROUTE_NAME:(context) => FavoritesScreen(),
              CartScreen.CART_SCREEN_ROUTE_NAME:(context) => CartScreen(),
              Event_Screen.EVENTS_ROUTE_NAME:(context)=> Event_Screen(),
              EventDetailsMobile.EVENTS_DETAILS_ROUTE_NAME: (context) => EventDetailsMobile(),
              EventDetailsWeb.EVENTS_DETAILS_WEB_ROUTE_NAME: (context) => EventDetailsWeb(),
              OrdersScreen.ORDERS_SCREEN_ROUTE_NAME:(context) => OrdersScreen(),

            },
            ),
    );
  }
}
