import 'package:carousel_slider/carousel_slider.dart';
import 'package:eco_friendly/controller/climate_change_controller.dart';
import 'package:eco_friendly/helpers/size_config.dart';
import 'package:eco_friendly/view/drawer/drawer_widget/climate_change_carosel_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ClimateChangeCarosel extends StatefulWidget {
  const ClimateChangeCarosel({Key? key}) : super(key: key);

  @override
  State<ClimateChangeCarosel> createState() => _ClimateChangeCaroselState();
}

class _ClimateChangeCaroselState extends State<ClimateChangeCarosel> {
  // ScrollController scrollController = ScrollController();
  //
  // @override
  // void initState() {
  //   Future.delayed(const Duration(seconds: 4), () {
  //     scrollController.animateTo(scrollController.position.maxScrollExtent,
  //         duration: Duration(seconds:  40), curve: Curves.linear);
  //   });
  //
  //   super.initState();
  // }
  //
  // @override
  // void dispose() {
  //   scrollController.dispose();
  //   super.dispose();
  // }
  // final animation=AnimationController(vsync: vsync);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.screenWidth!;
    double height = SizeConfig.screenHeight!;
    final ClimateCaroselSliderData =
    Provider.of<ClimateChangeController>(context);
    final climateCarosel = ClimateCaroselSliderData.getClimateCaroselList;
    return  Container(
      // width: width,
      // height: height *0.40,
      // color: Colors.green.withOpacity(0.8),
      // child: Container(
      //  child: GridView.builder(
      // itemCount: ClimateCaroselSliderData.getClimateChangeList.length,
      //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //     crossAxisCount: 1,
      //     childAspectRatio: 1.5 /3,
      //     crossAxisSpacing: 10,
      //     mainAxisSpacing: 10,
      //   ),
      //   scrollDirection: Axis.horizontal,
      //   itemBuilder: (context, index) {
      //       return ChangeNotifierProvider.value(
      //           value: climateCarosel[index],
      //           child: MobileCarosileWidget(index: index));
      //     },
      //   ),
      // ),
     child: Container(
      width: width,
      height: height*0.30,
      child: CarouselSlider.builder(
        itemCount: ClimateCaroselSliderData.getClimateCaroselList.length,
        itemBuilder: (BuildContext,index,real) {
          return ChangeNotifierProvider.value(
              value: climateCarosel[index],
              child: MobileCarosileWidget(index: index));
        },
        options: CarouselOptions(
          enlargeCenterPage: true,
          autoPlay: true,
          viewportFraction: 1,
          enlargeFactor: 0.3,
          autoPlayAnimationDuration: Duration(seconds: 4),
          autoPlayInterval: const Duration(seconds: 8),
        ),
      ),
     ),
    );
  }
}
