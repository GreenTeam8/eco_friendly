import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../../zhelpers/size_config.dart';
import '/view/Home/home_screen.dart';
import '../../zhelpers/constants.dart';
import '../../zhelpers/responsive.dart';
import '../Favorites/favorites_screen.dart';
import '../cart/cart_screen.dart';
import '../profile/profile_screen.dart';

class RootScreen extends StatefulWidget {
  RootScreen({Key? key}) : super(key: key);

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int currentIndex = 0;

  List<Widget> screens = [
    HomeScreen(),
    FavoritesScreen(),
    const CartScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    //double width = SizeConfig.screenWidth!;
    double height = SizeConfig.screenHeight!;
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: Responsive.isWeb(context)
          ? null
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: GNav(
                  backgroundColor: Colors.white,
                  color: Colors.grey[500],
                  activeColor: kPC,
                  curve: Curves.bounceIn,
                  gap: 1,
                  tabActiveBorder: Border.all(color: kPC, width: 1),
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
