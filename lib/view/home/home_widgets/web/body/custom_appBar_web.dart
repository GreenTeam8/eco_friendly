import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '/size_config.dart';
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
      padding: EdgeInsets.all(height* 0.02),
      decoration: BoxDecoration(
          color: kPC,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, -2),
                blurRadius: 30,
                color: Colors.black.withOpacity(0.15)
            )
          ]
      ),
      child: Row(
        children: [
        //   Container(
        // width: width * 0.05,
        // height: height * 0.05,
        // decoration: const BoxDecoration(
        //     shape: BoxShape.circle,
        //     color: Colors.white,
        //     image: DecorationImage(image: AssetImage('assets/images/eco-logo.png'),fit: BoxFit.cover,)
        // ),
        //   ),
          CircleAvatar(
            backgroundImage: AssetImage('assets/images/eco-logo.png',),
            radius: height* 0.03,
            backgroundColor: Colors.white,

          ),
          SizedBox(width: width* 0.01,),
          const Spacer(),
          MI.MenuItem(title: 'Home',onTap: (){},),
          MI.MenuItem(title: 'Favorites',onTap: (){},),
          MI.MenuItem(title: 'Cart',onTap: (){},),
          MI.MenuItem(title: 'About',onTap: (){},),
          MI.MenuItem(title: 'Profile',onTap: (){},),
         //ButtonWidget()
        ],
      ),
    );
  }
}