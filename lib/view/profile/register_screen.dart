import 'package:eco_friendly/view/profile/auth_widget.dart';
import 'package:eco_friendly/view/profile/profile_logo_widget.dart';
import 'package:eco_friendly/helpers/constants.dart';
import 'package:eco_friendly/helpers/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

import '../../helpers/responsive.dart';
import '../Home/home_screen.dart';

class RegisterScreen extends StatelessWidget {
  static const REGISTERSCREEN_ROUTE_NAME = '/registerScreen';
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.screenWidth!;
    double height = SizeConfig.screenHeight!;
    return Scaffold(
      body: Stack(
        children: [
          ClipPath(
            child: Container(
              color: mColor,
              width: width,
              height: height! * 0.40,
            ),
            clipper: OvalBottomBorderClipper(),
          ),
          IconButton(
            icon: Icon(Icons.arrow_back_ios, color: mainColor, size: 25),
            onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen(),));
            },
          ),
          Center(
              child: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ProfileLogoWidget(),
                      AuthenticationScreen(),
                    ],
                  ),
                ),
              )
          ),
        ],
      ),
    );
  }
}