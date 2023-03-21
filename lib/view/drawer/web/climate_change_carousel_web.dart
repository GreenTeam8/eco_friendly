import 'package:carousel_slider/carousel_slider.dart';
import 'package:eco_friendly/controller/climate_change_controller.dart';
import 'package:eco_friendly/helpers/size_config.dart';
import 'package:eco_friendly/view/drawer/drawer_widget/climate_carousel_web_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ClimateChangeCarouselWeb extends StatefulWidget {
  const ClimateChangeCarouselWeb({Key? key}) : super(key: key);

  @override
  State<ClimateChangeCarouselWeb> createState() => _ClimateChangeCarouselWebState();
}

class _ClimateChangeCarouselWebState extends State<ClimateChangeCarouselWeb> {
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

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.screenWidth!;
    double height = SizeConfig.screenHeight!;
    final ClimateCaroselSliderData =
    Provider.of<ClimateChangeController>(context);
    final climateCarosel = ClimateCaroselSliderData.getClimateCaroselList;
    return  Container(
      width: width,
      height: height *0.50,
      child: Container(
        width: width,
        height: height*0.50,
        child: CarouselSlider.builder(
          itemCount: ClimateCaroselSliderData.getClimateCaroselList.length,
          itemBuilder: (BuildContext,index,real) {
            return ChangeNotifierProvider.value(
                value: climateCarosel[index],
                child: WebCarosileWidget(index: index));
          },
          options: CarouselOptions(
            enlargeCenterPage: true,
            viewportFraction: 1,
            enlargeFactor: 0.1,
            // autoPlayAnimationDuration: Duration(seconds: 4),
            // autoPlayInterval: const Duration(seconds: 6),
          ),
        ),
      ),
    );
  }
}
