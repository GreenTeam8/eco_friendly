import 'package:flutter/material.dart';

import '../../screens/home_screen.dart';
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
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(style.colorScheme.primary),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
        elevation: MaterialStateProperty.all(0),
        padding: MaterialStateProperty.all(EdgeInsets.all( 10))
      ),
      child: Text(currentIndex == onboardingContent.length-1 ?'Home':'>', style: const TextStyle(fontSize: 30),),
      onPressed: (){
        if(currentIndex == onboardingContent.length -1){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
        }
        _controller!.nextPage(duration: const Duration(milliseconds: 100), curve: Curves.bounceIn);
      },
    );
  }
}