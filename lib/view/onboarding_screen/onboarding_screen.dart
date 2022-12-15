import '../../zhelpers/constants.dart';
import 'package:eco_friendly/controller/onboarding_controller.dart';
import '../../zhelpers/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
    double height = SizeConfig.screenHeight!;
    double width = SizeConfig.screenWidth!;
    return Scaffold(
      body: GetBuilder<OnBoardingController>(
        init: OnBoardingController(),
        builder: (controller) {
          return Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _controller,
                  itemCount: controller.onboardingContent.length,
                  onPageChanged: (index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.all(width * 0.1),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(controller.onboardingContent[index].imagePath!),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          Text(
                            controller.onboardingContent[index].title!,
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          const Divider(
                            color: kPC,
                            thickness: 2,
                          ),
                          Text(
                            controller.onboardingContent[index].description!,
                            style: Theme.of(context).textTheme.bodyText2,
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
              ///dots with button widget
              Padding(
                padding: EdgeInsets.all(width * 0.03),
                child: Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: List.generate(
                            controller.onboardingContent.length,
                                (index) => DotsBuilder(
                              listIndex: index,
                              currentIndex: currentIndex,
                            )),
                      ),
                    ),
                    ButtonWidget(

                        style: Theme.of(context),
                        currentIndex: currentIndex,
                        controller: _controller,
                        onController: controller,)
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
