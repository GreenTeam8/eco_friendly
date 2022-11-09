import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:eco_friendly/view/onboarding_screen/onboarding_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter/material.dart';
import '/view/screens/home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        splash: Column(
          ///here we created a column of the splash_screen screen content
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('assets/json/splash_animation.json',),
            //Image.asset('assets/images/tree_animation.png'),
            Text('Eco-Friendly', style:TextStyle(fontSize: 40, fontFamily: 'LilitaOne'),)
          ],
        ),
        ///specifying the splash_screen icon size
        splashIconSize: 500,
        ///specifying the duration of the splash_screen screen
        duration: 10000,
        ///the way of displaying the splash_screen content
        splashTransition: SplashTransition.fadeTransition,
        /// the duration of splash_screen transition
        animationDuration: Duration(milliseconds: 500),
        /// how to transition the splash_screen screen
        pageTransitionType: PageTransitionType.rightToLeft,
        nextScreen: OnBoardingScreen());
    /// need more enhancement : green color at the top + text upgrade
  }
}
