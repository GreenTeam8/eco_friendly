import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:eco_friendly/controller/climate_change_controller.dart';
import 'package:eco_friendly/helpers/constants.dart';
import 'package:eco_friendly/helpers/responsive.dart';
import 'package:eco_friendly/helpers/size_config.dart';
import 'package:eco_friendly/view/Home/home_screen.dart';
import 'package:eco_friendly/view/drawer/drawer_widget/climate_change_web_widget.dart';
import 'package:eco_friendly/view/drawer/drawer_widget/tacling_climate_widget.dart';
import 'package:eco_friendly/view/drawer/web/climate_change_details_web.dart';
import 'package:eco_friendly/view/drawer/web/custom_clip_path.dart';
import 'package:eco_friendly/view/drawer/web/tacling_climate_web.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import '../mobile/climate_change_mobile.dart';
import 'climate_change_carousel_web.dart';

class ClimateChangeWeb extends StatefulWidget {
  const ClimateChangeWeb({Key? key}) : super(key: key);

  @override
  State<ClimateChangeWeb> createState() => _ClimateChangeWebState();
}
bool transWeb=true;
class _ClimateChangeWebState extends State<ClimateChangeWeb> {
  Future? _caroelChange;
  Future? _climateChange;
  Future? _taclingItems;
  Future _climateChangeItem (){
    return Provider.of<ClimateChangeController>(context, listen: false).fetchClimateChange();
  }
  Future _caroselItems (){
    return Provider.of<ClimateChangeController>(context, listen: false).fetchcaroselSlider();
  }
  Future _TaclingItems (){
    return Provider.of<ClimateChangeController>(context, listen: false).fetchTaclingClimate();
  }

  @override
  void initState() {
    _climateChange = _climateChangeItem();
    _caroelChange = _caroselItems();
    _taclingItems = _TaclingItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.screenWidth!;
    double height = SizeConfig.screenHeight!;
    final ClimateChangeData = Provider.of<ClimateChangeController>(context);
    final climateChange = ClimateChangeData.getClimateChangeList;
          return Responsive.isWeb(context)
              ? WillPopScope(
            onWillPop: ()async=>true,
                child: Scaffold(
                          body: FutureBuilder(
                          future: _caroelChange,
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Center(
                                child: Text(''),
                                  );
                            } else {
                              return ListView(
                                children: [
                                  Container(
                                    height: height,
                                    width: width,
                                    child: Stack(
                                      children: [
                                        Container(
                                          height: height * 0.75,
                                          width: width,
                                          decoration: BoxDecoration(
                                            // borderRadius: BorderRadius.circular(10),
                                            image:DecorationImage(
                                              image:AssetImage('assets/images/back.jpg',),
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                            top:20,
                                            left: 1400,
                                            right:10,
                                            // bottom: 0,
                                          child: IconButton(
                                            icon: Icon(
                                              Icons.language_sharp,
                                              color: mainColor,
                                              size: 30,
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                transWeb=!transWeb;
                                              });
                                            },
                                          ),
                                        ),
                                        Positioned(
                                          top:450,
                                          left: 20,
                                          right:20,
                                          bottom: 0,
                                          child: Container(
                                            height: height ,
                                            width: width ,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10),
                                            color:Colors.grey[200],
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.all(height*0.020),
                                              child: FutureBuilder(
                                              future: _taclingItems,
                                              builder: (context, snapshot){
                                                return TaclingClimateWeb();
                                              }
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: width * 0.80,
                                    height: height,
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        FutureBuilder(
                                          future: _climateChange,
                                          builder: (context, snapshot){
                                            return Container(
                                              width: width * 0.80,
                                              height: height,
                                              padding: EdgeInsets.all(height * 0.02),
                                              decoration: BoxDecoration(
                                              ),
                                              child: GridView.builder(
                                                // physics: NeverScrollableScrollPhysics(),
                                                itemCount: ClimateChangeData
                                                    .getClimateChangeList.length,
                                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 3,
                                                  childAspectRatio: 3 / 2,
                                                  crossAxisSpacing: 10,
                                                  mainAxisSpacing: 10,
                                                ),
                                                itemBuilder: (context, index) {
                                                  return ChangeNotifierProvider.value(
                                                      value: climateChange[index],
                                                      child: ClimateChangeWebWidget(
                                                          index: index));
                                                },
                                              ),
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            }
                          },
                          ),

                        ),
              )
             :ClimateChangeMobile();

  }
}
