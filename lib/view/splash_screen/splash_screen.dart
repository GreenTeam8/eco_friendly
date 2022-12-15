

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:eco_friendly/view/root_screen/root_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '/view/onboarding_screen/onboarding_screen.dart';
import '../../zhelpers/constants.dart';
import '../../zhelpers/responsive.dart';
import '../../zhelpers/size_config.dart';

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
              width: width * 0.6,
              height: height * 0.6,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                image: DecorationImage(image: AssetImage('assets/images/eco-logo.png'),fit: BoxFit.cover)
              ),
            ),

        ),
        ///specifying the splash_screen icon size
        splashIconSize: 500,
        ///specifying the duration of the splash_screen screen
        duration: 1000,
        ///the way of displaying the splash_screen content
        splashTransition: SplashTransition.rotationTransition,
        backgroundColor: kPC,
        /// the duration of splash_screen transition
        animationDuration: const Duration(milliseconds: 1200),
        /// how to transition the splash_screen screen
        pageTransitionType: PageTransitionType.bottomToTop,
        curve: Curves.easeOut,
        nextScreen: Responsive.checkPlatform() ?  RootScreen() : OnBoardingScreen() ,
    );
    /// need more enhancement : green color at the top + text upgrade
  }
}
