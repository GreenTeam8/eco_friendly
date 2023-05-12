import 'package:eco_friendly/view/cart/cart_screen.dart';
import 'package:eco_friendly/view/favorites/favorites_screen.dart';
import 'package:eco_friendly/view/profile/user_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../../controller/authentication_controller.dart';
import '../../../../helpers/constants.dart';
import '../../../../helpers/size_config.dart';

import '../../../profile/register_screen.dart';
import 'menu_item_widget.dart' as MI;

class CustomAppBarWeb extends StatelessWidget {
  const CustomAppBarWeb({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double height = SizeConfig.screenHeight!;
    double width = SizeConfig.screenWidth!;
    final auth = Provider.of<AuthenticationController>(context);

    return Container(
      margin: EdgeInsets.all(height * 0.01),
      padding: EdgeInsets.all(height * 0.02),
      decoration: BoxDecoration(
          color: mColor,
          borderRadius: BorderRadius.circular(10),

          // boxShadow: [
          //   BoxShadow(
          //       offset: const Offset(0, -2),
          //       blurRadius: 30,
          //       color: Colors.black.withOpacity(0.15))
          // ]
      ),
      child: Row(
        children: [
          Container(
            height: height * 0.05,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: Image.asset('assets/images/ecoIcon.png',),
          ),
          // CircleAvatar(
          //   backgroundImage: AssetImage(
          //     'assets/images/ecoIcon.png',
          //   ),
          //   radius: height * 0.025,
          //   backgroundColor: Colors.white,
          // ),
          SizedBox(
            width: width * 0.01,
          ),
          const Spacer(),
          MI.MenuItem(
            title: 'Home',
            onTap: () {},
          ),
          MI.MenuItem(
            title: 'Favorites',
            onTap: () {
             // Navigator.pushNamed(context, FavoritesScreen.FAVORITES_ROUTE_NAME);
            },
          ),
          MI.MenuItem(
            title: 'Cart',
            onTap: () {
              Navigator.pushNamed(context, CartScreen.CART_SCREEN_ROUTE_NAME);
            },
          ),
          MI.MenuItem(
            title: 'About',
            onTap: () {},
          ),
          MI.MenuItem(
            title: 'Profile',
            onTap: () {
            auth.isAuth ? Navigator.pushNamed(context, UserProfileScreen.USERPROFILESCREEN_ROUTE_NAME)
                : Navigator.pushNamed(context, RegisterScreen.REGISTERSCREEN_ROUTE_NAME);
            },
          ),
          //ButtonWidget()
        ],
      ),
    );
  }
}
