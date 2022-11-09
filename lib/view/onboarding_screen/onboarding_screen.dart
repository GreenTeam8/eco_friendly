import 'package:eco_friendly/view/onboarding_screen/onboarding_model.dart';
import 'package:flutter/material.dart';
import '../screens/home_screen.dart';
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
                    padding: const EdgeInsets.all(40.0),
                    child: Column(
                      children: [
                        Image.asset(onboardingContent[index].imagePath!),
                        Text(onboardingContent[index].title!, style: TextStyle(fontFamily: 'LilitaOne', fontSize: 35),),
                        Divider(),
                        Text(onboardingContent[index].description!,
                        style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.bold, color: Colors.grey[800]) ,)
                      ],
                    ),
                  );
                } ,),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              //textBaseline: TextBaseline.alphabetic,
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Row(
                    children: List.generate(onboardingContent.length, (index) =>
                        dotsBuilder(listIndex: index,currentIndex: currentIndex,)
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  alignment: Alignment.bottomRight,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.greenAccent),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
                      elevation: MaterialStateProperty.all(0),
                      //padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 50))
                    ),
                    child: Text(currentIndex == onboardingContent.length-1 ?'Home':'>', style: TextStyle(fontSize: 30),),
                    onPressed: (){
                      if(currentIndex == onboardingContent.length -1){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
                      }
                      _controller!.nextPage(duration: Duration(milliseconds: 100), curve: Curves.bounceIn);
                    },
                  ),
                )

            ],
            ),
          ),


        ],
      ),
    );
  }
}


