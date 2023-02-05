import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../helpers/constants.dart';
import '../../../../helpers/size_config.dart';
import '../../../Favorites/favorites_screen.dart';
import 'menu_item_widget.dart' as MI;

class CustomAppBarWeb extends StatelessWidget {
  const CustomAppBarWeb({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double height = SizeConfig.screenHeight!;
    double width = SizeConfig.screenWidth!;

    return Container(
      margin: EdgeInsets.all(height * 0.01),
      padding: EdgeInsets.all(height * 0.02),
      decoration: BoxDecoration(
          color: pColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, -2),
                blurRadius: 30,
                color: Colors.black.withOpacity(0.15))
          ]),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(
              'assets/images/eco-logo.png',
            ),
            radius: height * 0.03,
            backgroundColor: Colors.white,
          ),
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
              Get.toNamed(FavoritesScreen.routeName);
            },
          ),
          MI.MenuItem(
            title: 'Cart',
            onTap: () {},
          ),
          MI.MenuItem(
            title: 'About',
            onTap: () {},
          ),
          MI.MenuItem(
            title: 'Profile',
            onTap: () {},
          ),
          //ButtonWidget()
        ],
      ),
    );
  }
}
