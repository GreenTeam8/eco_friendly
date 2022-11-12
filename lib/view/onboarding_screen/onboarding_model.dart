class OnBoardingModel {
  String? title;
  String? imagePath;
  String? description;

  OnBoardingModel({this.title, this.imagePath, this.description});

}
List<OnBoardingModel> onboardingContent = [
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