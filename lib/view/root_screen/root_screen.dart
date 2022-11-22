import 'package:eco_friendly/constants.dart';
import 'package:eco_friendly/responsive.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

import '../Favorites/favorites_screen.dart';
import '../cart/cart_screen.dart';
import '../profile/profile_screen.dart';
import '/view/Home/home_screen.dart';




class RootScreen extends StatefulWidget {
   const RootScreen({Key? key}) : super(key: key);

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {

  int currentIndex = 0;
  List<Widget> screens = [
    HomeScreen(),
    const FavoritesScreen(),
    const CartScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar:
        Responsive.isWeb(context)
          ? null
          :FloatingNavbar(
        currentIndex: currentIndex,
        backgroundColor: kPC,
        selectedItemColor: kPC,
        borderRadius: 10,
        elevation: 20,
        items: [
          FloatingNavbarItem(icon: Icons.home, title: 'Home'),
          FloatingNavbarItem(icon: Icons.favorite, title: 'Favorites'),
          FloatingNavbarItem(icon: Icons.shopping_cart, title: 'Cart'),
          FloatingNavbarItem(icon: Icons.person, title: 'Profile'),
        ],
        onTap: (index){
          setState((){
            currentIndex = index;
          });
        },
      )
    );
  }
}