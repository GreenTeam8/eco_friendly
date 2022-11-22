import 'package:get/get.dart';

import '../model/onboarding.dart';

class OnBoardingController extends GetxController{

  final List<OnBoardingModel> _onboardingContent =  [
    OnBoardingModel(
        title: 'Climate Change',
        imagePath: 'assets/images/crying_earth.png',
        description: 'Our planet is crying out for us, let\'s be a united nation against the climate change.'),
    OnBoardingModel(
        title: 'Eco-Friendly life',
        imagePath: 'assets/images/eco-friendly_planet.png',
        description: 'Every step you take towards eco-friendly living is one that helps the world.'),
    OnBoardingModel(
        title: 'Big Family',
        imagePath: 'assets/images/our_planet.png',
        description: 'Save your planet, Save your family, Save yourself.'),
  ];

  List<OnBoardingModel> get onboardingContent => _onboardingContent;
}