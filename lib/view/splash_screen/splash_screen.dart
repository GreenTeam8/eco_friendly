

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:eco_friendly/controller/authentication_controller.dart';
import 'package:eco_friendly/view/Home/home_screen.dart';
import 'package:eco_friendly/view/root_screen/root_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '/view/onboarding_screen/onboarding_screen.dart';
import '../../helpers/constants.dart';
import '../../helpers/responsive.dart';
import '../../helpers/size_config.dart';

class SplashScreen extends StatelessWidget {
   SplashScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    SizeConfig().init(context);
    double width = SizeConfig.screenWidth!;
    double height = SizeConfig.screenHeight!;

    return AnimatedSplashScreen(
        splash: Center(
          ///here we created a Container of the splash_screen screen content
            child: Container(
               width: width * 0.4,
               height: height * 0.4,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                image: DecorationImage(image: AssetImage('assets/images/ecoIcon.png'),fit: BoxFit.none)
              ),
            ),

        ),
        ///specifying the splash_screen icon size
        splashIconSize: 500,
        ///specifying the duration of the splash_screen screen
        duration: 1000,
        ///the way of displaying the splash_screen content
        splashTransition: SplashTransition.rotationTransition,
        backgroundColor: mColor,
        /// the duration of splash_screen transition
        animationDuration: const Duration(milliseconds: 1200),
        /// how to transition the splash_screen screen
        pageTransitionType: PageTransitionType.rightToLeft,
        curve: Curves.easeOut,
        nextScreen:
        Consumer<AuthenticationController>(
          builder: (context, value, child) =>
          Responsive.checkPlatform() ?  RootScreen() :
              value.isAuth? RootScreen()
              : FutureBuilder(
                future: value.tryAutoLogin(),
                builder: (context, snapshot) =>
                snapshot.connectionState == ConnectionState.waiting ?
                    CircularProgressIndicator()
                    :OnBoardingScreen())) ,
    );
    /// need more enhancement : green color at the top + text upgrade
  }
}
