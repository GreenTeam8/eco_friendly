import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:eco_friendly/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../Favorites/favorites_screen.dart';
import '../cart/cart_screen.dart';
import '../profile/profile_screen.dart';
import '/view/Home/home_screen.dart';
import '/controller/bottom_navBar_controller.dart';
import 'root_screen_widgets/floating_action_button.dart';


class RootScreen extends StatefulWidget {
   const RootScreen({Key? key}) : super(key: key);

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  List<IconData> iconList = [
    Icons.home,
    Icons.favorite,
    Icons.shopping_cart,
    Icons.person,
  ];
  List<Widget> screens = [
    HomeScreen(),
    FavoritesScreen(),
    CartScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BottomNavigationBarController());
    return Scaffold(
      body: screens.elementAt(controller.getSelectedIndex),
      floatingActionButton: const FloatingActButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: AnimatedBottomNavigationBar(
        splashColor: kPrimaryColor,
        activeColor: kPrimaryColor,
        inactiveColor: Colors.black.withOpacity(0.5),
        activeIndex: controller.getSelectedIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.softEdge,
        icons: iconList,
        elevation: 20,
        onTap: (index){
          setState((){
            controller.setSelectedIndex = index;
          });
        },
      ),
    );
  }
}



