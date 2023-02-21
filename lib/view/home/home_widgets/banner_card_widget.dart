
import 'package:carousel_slider/carousel_slider.dart';
import 'package:eco_friendly/controller/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../helpers/responsive.dart';
import '../../../helpers/size_config.dart';

class BannerCardWidget extends StatelessWidget {
  const BannerCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double height = SizeConfig.screenHeight!;
    double width = SizeConfig.screenWidth!;
    final carouselController = Provider.of<CarousellController>(context);
    return Container(
      //alignment: Alignment.bottomLeft,
      height: height ,
      width: width,
      margin: EdgeInsets.all(height * 0.01),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          // image: DecorationImage(
          //     image: const AssetImage('assets/images/banner.jpg'),
          //     fit: BoxFit.cover,
          //     colorFilter: ColorFilter.mode(
          //         Colors.black.withOpacity(0.20), BlendMode.multiply)),
          ///
          // boxShadow: [
          //   BoxShadow(
          //       color: Colors.black26.withOpacity(0.20),
          //       offset: const Offset(6, 6),
          //       blurRadius: 10)
          // ]
    ),
      child:
      Stack(
        children: [
          CarouselSlider.builder(
            itemCount: carouselController.carouselList.length,
            options: CarouselOptions(
              height: height,
              autoPlay: true,
              viewportFraction: 1,
              autoPlayAnimationDuration: Duration(
                  seconds: 2
              ),
              disableCenter: true,
              enlargeFactor: 0.5,
              enlargeCenterPage: true,
              autoPlayCurve: Curves.fastOutSlowIn
            ),
            itemBuilder: (BuildContext context, int index, int realIndex) {
              return  ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: ColorFiltered(
                    colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.35), BlendMode.multiply),
                    child: Image.asset('assets/images/${carouselController.carouselList[index].carouselImage}', fit: BoxFit.cover,)),
              );
            },


          ),
          Padding(
              padding: EdgeInsets.all(width * 0.02),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: 'Save the Earth \n',
                            style: Theme.of(context).textTheme.bodyText1),
                        TextSpan(
                            text:
                            'Our planet is crying out for us, lets be a united nation against the climate change.',
                            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: Responsive.isWeb(context) ? 35 : 16))
                      ])),
                ],
              )),
        ],
      )


    );
  }
}
