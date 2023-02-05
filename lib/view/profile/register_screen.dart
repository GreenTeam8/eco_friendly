import 'package:eco_friendly/view/profile/auth_widget.dart';
import 'package:eco_friendly/view/profile/profile_logo_widget.dart';
import 'package:eco_friendly/helpers/constants.dart';
import 'package:eco_friendly/helpers/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

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
              height: height! * 0.5,
            ),
            clipper: OvalBottomBorderClipper(),
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
