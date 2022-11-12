import 'package:eco_friendly/size_config.dart';
import 'package:flutter/material.dart';

import '/view/onboarding_screen/onboarding_model.dart';
import '/view/onboarding_screen/onboarding_widgets/button_widget.dart';
import 'onboarding_widgets/dots_widget.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {

  int currentIndex = 0;
  PageController? _controller;

  ///method when start the onboarding the initial page will be indexed 0
  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  ///to dispose the controller when we close the onboarding
  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    ThemeData style = Theme.of(context);
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
                itemCount: onboardingContent.length,
                onPageChanged: (index){
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  return Padding(
                    padding:  EdgeInsets.all(SizeConfig.screenWidth! * 0.1),
                    child: Column(
                      children: [
                        Image.asset(onboardingContent[index].imagePath!),
                        SizedBox(height: SizeConfig.screenHeight! * 0.02,),
                        Text(onboardingContent[index].title!, style: style.textTheme.bodyText1,),
                        const Divider(),
                        Text(onboardingContent[index].description!,
                        style: style.textTheme.bodyText2,)
                      ],
                    ),
                  );
                } ,),
          ),
          Padding(
            padding:  EdgeInsets.all(SizeConfig.screenWidth! * 0.03),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Row(
                    children: List.generate(onboardingContent.length, (index) =>
                        DotsBuilder(listIndex: index,currentIndex: currentIndex,)
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: SizeConfig.screenHeight! * 0.02),
                  alignment: Alignment.bottomRight,
                  child: ButtonWidget(style: style, currentIndex: currentIndex, controller: _controller),
                )
            ],
            ),
          ),

        ],
      ),
    );
  }
}




