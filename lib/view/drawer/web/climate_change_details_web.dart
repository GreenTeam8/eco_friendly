import 'dart:math';

import 'package:eco_friendly/controller/climate_change_controller.dart';
import 'package:eco_friendly/helpers/constants.dart';
import 'package:eco_friendly/helpers/responsive.dart';
import 'package:eco_friendly/helpers/size_config.dart';
import 'package:eco_friendly/view/drawer/mobile/climate_change_details_mobile.dart';
import 'package:eco_friendly/view/drawer/mobile/climate_change_mobile.dart';
import 'package:eco_friendly/view/drawer/web/custom_clip_path.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ClimateChangeDetailWeb extends StatefulWidget {
  static const CLIMATE_DETAILS_WEB_ROUTE_NAME = '/ClimateChangeDetailWeb';

  ClimateChangeDetailWeb({Key? key, }) : super(key: key);

  @override
  State<ClimateChangeDetailWeb> createState() => _ClimateChangeDetailWebState();
}

class _ClimateChangeDetailWebState extends State<ClimateChangeDetailWeb> {
  String? ItemsId;
  bool isShowmore=true;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.screenWidth!;
    double height = SizeConfig.screenHeight!;
    final Map routeArguments =
    ModalRoute.of(context)?.settings.arguments as Map<String, String?>;

    ItemsId = routeArguments['Id'];
    final loadItems = Provider.of<ClimateChangeController>(context)
        .findItemsById(ItemsId!);
    return Responsive.isWeb(context)
        ? WillPopScope(
      onWillPop:()async=>true,
      child: Scaffold(
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
                                Colors.black.withOpacity(0.15), BlendMode.multiply),
                          image: NetworkImage(
                            loadItems.image!,
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
                                transs?loadItems.name!:loadItems.nameAr!,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                  color: mainColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 50,
                                ),
                              ),
                              SizedBox(
                                height: height*0.02,
                              ),
                              Text(
                                transs?loadItems.ItemDescription!:loadItems.ItemDescription!,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2!
                                    .copyWith(
                                  color: Colors.white,
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
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              children: [
                                Text(
                                  loadItems.ItemTitle!,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                    color: mainColor,
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
                                      loadItems.Aimage!,
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
                                            transs?loadItems.Atitle!:loadItems.AtitleAr!,

                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium!
                                                .copyWith(
                                              color: mainColor,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          transs ?loadItems.Adescription!:loadItems.AdescriptionAr!,
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
                                            transs?loadItems.Btitle!:loadItems.BtitleAr!,

                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium!
                                                .copyWith(
                                              color: mainColor,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          transs ?loadItems.Bdescription!:loadItems.BdescriptionAr!,
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
                                      loadItems.Bimage!,
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
              ScrollTransformItem(
                builder:(scrollOffset){
                  return Column(
                    children: [
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
                                  loadItems.Cimage!,
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
                                        transs?loadItems.Ctitle!:loadItems.CtitleAr!,

                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(
                                          color: mainColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      transs ?loadItems.Cdescription!:loadItems.CdescriptionAr!,
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
                                          transs?loadItems.Dtitle!:loadItems.DtitleAr!,

                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(
                                            color: mainColor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        transs ?loadItems.Ddescription!:loadItems.DdescriptionAr!,
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
                                    loadItems.Dimage!,
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
        :ClimateChangeDetailMobil();
  }
}
