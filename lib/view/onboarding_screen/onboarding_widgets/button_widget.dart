import '../../../helpers/constants.dart';
import 'package:eco_friendly/controller/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../helpers/size_config.dart';
import '../../root_screen/root_screen.dart';


class ButtonWidget extends StatelessWidget {

  final ThemeData style;
  final int currentIndex;
  final PageController? _controller;
  final OnBoardingController onController;

  const ButtonWidget({
    Key? key,
    required this.style,
    required this.currentIndex,
    required this.onController,
    required PageController? controller,
  }) : _controller = controller, super(key: key);



  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.screenWidth!;
    double height = SizeConfig.screenHeight!;
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(mColor),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
        elevation: MaterialStateProperty.all(0),
        padding: MaterialStateProperty.all(EdgeInsets.all(height* 0.03))
      ),
      child: Text(currentIndex == onController.onboardingContent.length-1 ?'Home':'>', style: const TextStyle(fontSize: 25),),
      onPressed: (){
        if(currentIndex == onController.onboardingContent.length -1){
          Get.off(RootScreen());
        }
        _controller!.nextPage(duration: const Duration(milliseconds: 100), curve: Curves.easeIn);
      },
    );
  }
}