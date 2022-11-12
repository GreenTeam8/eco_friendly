import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter/material.dart';


import '/view/onboarding_screen/onboarding_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    ThemeData style = Theme.of(context);

    return AnimatedSplashScreen(
        splash: Column(
          ///here we created a column of the splash_screen screen content
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('assets/json/splash_animation.json',),
            Text('Eco-Friendly', style: style.textTheme.bodyText1,)
          ],
        ),
        ///specifying the splash_screen icon size
        splashIconSize: 500,
        ///specifying the duration of the splash_screen screen
        duration: 10000,
        ///the way of displaying the splash_screen content
        splashTransition: SplashTransition.fadeTransition,
        /// the duration of splash_screen transition
        animationDuration: const Duration(milliseconds: 600),
        /// how to transition the splash_screen screen
        pageTransitionType: PageTransitionType.leftToRight,
        nextScreen: OnBoardingScreen());
    /// need more enhancement : green color at the top + text upgrade
  }
}
