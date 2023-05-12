import 'package:eco_friendly/view/profile/user_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';

import '../../controller/authentication_controller.dart';
import '../../helpers/size_config.dart';
import '../Home/web/body/custom_appBar_web.dart';
import '/view/Home/home_screen.dart';
import '../../helpers/constants.dart';
import '../../helpers/responsive.dart';
import '../Favorites/favorites_screen.dart';
import '../cart/cart_screen.dart';
import '../profile/register_screen.dart';

class RootScreen extends StatefulWidget {
  static const ROOT_SCREEN_ROUTE_NAME = '/rootscreen';
  RootScreen({Key? key}) : super(key: key);

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int currentIndex = 0;

  List<Widget> screens = [
    HomeScreen(),
    FavoritesScreen(),
    CartScreen(),
    Consumer<AuthenticationController>(
        builder: (context, value, child) =>
        value.isAuth? UserProfileScreen()
            :RegisterScreen()),
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    //double width = SizeConfig.screenWidth!;
    double height = SizeConfig.screenHeight!;
    return Scaffold(
     // resizeToAvoidBottomInset: false,
      body: screens[currentIndex],
      bottomNavigationBar: Responsive.isWeb(context)
          ? null
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: GNav(
                  backgroundColor: bgColor,
                  color: Colors.grey[400],
                  activeColor: mainColor,
                  curve: Curves.bounceIn,
                  gap: 1,
                  //tabBackgroundColor: kPC,
                  //tabActiveBorder: Border.all(color: kPC, width: 1),
                  padding: EdgeInsets.all(height * 0.02),
                  selectedIndex: currentIndex,
                  onTabChange: (value) {
                    setState(() {
                      currentIndex = value;
                    });
                  },
                  tabs: [
                    GButton(
                      icon: Icons.home,
                      text: 'Home',
                    ),
                    GButton(
                      icon: Icons.favorite,
                      text: 'Favorites',
                    ),
                    GButton(
                      icon: Icons.shopping_cart,
                      text: 'Cart',
                    ),
                    GButton(
                      icon: Icons.person,
                      text: 'Profile',
                    ),
                  ]),
            ),
    );
  }
}
