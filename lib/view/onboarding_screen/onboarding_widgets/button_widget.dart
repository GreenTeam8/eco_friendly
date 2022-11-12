import 'package:eco_friendly/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../size_config.dart';
import '../../root_screen/root_screen.dart';
import '../onboarding_model.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    Key? key,
    required this.style,
    required this.currentIndex,
    required PageController? controller,
  }) : _controller = controller, super(key: key);

  final ThemeData style;
  final int currentIndex;
  final PageController? _controller;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.screenWidth!;

    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(kPrimaryColor),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
        elevation: MaterialStateProperty.all(0),
        padding: MaterialStateProperty.all(EdgeInsets.all(width* 0.03))
      ),
      child: Text(currentIndex == onboardingContent.length-1 ?'home':'>', style: const TextStyle(fontSize: 25),),
      onPressed: (){
        if(currentIndex == onboardingContent.length -1){
          Get.off(RootScreen());
        }
        _controller!.nextPage(duration: const Duration(milliseconds: 100), curve: Curves.bounceInOut);
      },
    );
  }
}