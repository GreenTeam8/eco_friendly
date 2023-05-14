import 'dart:math';

import 'package:eco_friendly/controller/climate_change_controller.dart';
import 'package:eco_friendly/helpers/constants.dart';
import 'package:eco_friendly/helpers/responsive.dart';
import 'package:eco_friendly/helpers/size_config.dart';
import 'package:eco_friendly/view/drawer/mobile/tacling_climate_details_mobile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../mobile/climate_change_details_mobile.dart';
import 'climate_change_web.dart';

class TaclingClimateChangeDetailWeb extends StatefulWidget {
  static const TACLING_CLIMATE_DETAILS_WEB_ROUTE_NAME = '/TaclingClimateChangeDetailWeb';

  TaclingClimateChangeDetailWeb({Key? key, }) : super(key: key);

  @override
  State<TaclingClimateChangeDetailWeb> createState() => _TaclingClimateChangeDetailWebState();
}

class _TaclingClimateChangeDetailWebState extends State<TaclingClimateChangeDetailWeb> {
  String? TaclingItemsId;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.screenWidth!;
    double height = SizeConfig.screenHeight!;
    final Map routeArguments =
    ModalRoute.of(context)?.settings.arguments as Map<String, String?>;

    TaclingItemsId = routeArguments['Id'];
    final loadItems = Provider.of<ClimateChangeController>(context)
        .findTaclingItemsById(TaclingItemsId!);
    return Responsive.isWeb(context)
        ? WillPopScope(
        onWillPop: ()async=>true,
      child:Scaffold(
      body: SafeArea(
        child: ScrollTransformView(
          children: [
            ScrollTransformItem(
              builder:(scrollOffset) {
                final screenSize=min(scrollOffset/height,1);
                return Container(
                  margin: EdgeInsets.only(top: height * 0.020),
                  width: width*0.90 -(width*0.3*screenSize),
                  height: height*0.90-(height*0.2*screenSize),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.08), BlendMode.multiply),
                      image: NetworkImage(
                        loadItems.image2!,
                      ),
                    ),
                  ),
                );
              },
              offsetBuilder:(scrollOffset){
                final screenSize= min(scrollOffset / height, 1);
                final heightAmount=height*0.2*screenSize;
                final bool StartMovingImage=scrollOffset>=height*0.27;
                final onScreenoffset =scrollOffset+heightAmount/2;
                return Offset(
                  0,!StartMovingImage
                    ?onScreenoffset
                    :onScreenoffset-(scrollOffset-heightAmount*0.27),
                );
              },
            ),
            ScrollTransformItem(
              builder:(scrollOffset) {
                return Container(
                  width: width*0.60,
                  // height: height * 0.50,
                  padding: EdgeInsets.all(height*0.020),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          transWeb?loadItems.title!:loadItems.titleAr!,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(
                            color: mColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 50,
                          ),
                        ),
                        SizedBox(
                          height: height*0.02,
                        ),
                        Text(
                          transWeb?loadItems.description!:loadItems.descriptionAr!,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                          overflow: TextOverflow.fade,
                          textAlign: TextAlign.start,

                        ),
                      ],
                    ),
                  ),
                );
              },
              offsetBuilder:(scrollOffset)=>Offset(0,-height*0.60),
            ),
            ScrollTransformItem(
              builder:(scrollOffset){
                return Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(width*0.020),
                      child: Row(
                        children: [
                          Text(
                            transWeb?'Tacling Climate Change':'مكافحة تغير المناخ',
                            // transWeb?loadItems.ItemTitle!:loadItems.ItemTitleAr!,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(
                              color: mColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.all(10),
                          width: width * 0.40,
                          height: height * 0.50,
                          decoration: BoxDecoration(
                            // borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(
                                loadItems.image3!,
                              ),
                            ),
                          ),
                        ),
                        // SizedBox(
                        //   height: height * 0.020,
                        // ),
                        Container(
                          width: width * 0.55,
                          height: height * 0.50,
                          child: Container(
                            color: Colors.green[50],
                            padding: EdgeInsets.all(height * 0.020),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Center(
                                    child: Text(
                                      transWeb?loadItems.title2!:'',

                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                        color: mColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    transWeb ?loadItems.description3!:loadItems.descriptionAr3!,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                      color: Colors.grey[800],
                                    ),
                                    overflow: TextOverflow.fade,
                                    textAlign: TextAlign.justify,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
            ScrollTransformItem(
                builder:(scrollOffset){
                  return Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            width: width * 0.55,
                            height: height * 0.50,
                            child: Container(
                              color: Colors.green[50],
                              padding: EdgeInsets.all(height * 0.020),
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Center(
                                      child: Text(
                                        transWeb?loadItems.title3!:''!,

                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(
                                          color: mColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      transWeb ?loadItems.description4!:loadItems.descriptionAr4!,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                        color: Colors.grey[800],
                                      ),
                                      overflow: TextOverflow.fade,
                                      textAlign: TextAlign.justify,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(10),
                            width: width * 0.40,
                            height: height * 0.50,
                            decoration: BoxDecoration(
                              // borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(
                                  loadItems.image4!,
                                ),
                              ),
                            ),
                          ),
                          // SizedBox(
                          //   height: height * 0.020,
                          // ),

                        ],
                      ),
                    ],
                  );
                }
            ),
          ],
        ),
      ),
    ),
    )
            :TaclingClimateChangeDetailMobile();
  }
}