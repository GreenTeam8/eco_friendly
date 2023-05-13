

import 'package:eco_friendly/controller/climate_change_controller.dart';
import 'package:eco_friendly/helpers/constants.dart';
import 'package:eco_friendly/helpers/size_config.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class TaclingClimateChangeDetailMobile extends StatefulWidget {
  static const TACLING_CLIMATE_DETAILS_MOBILE_ROUTE_NAME = '/TaclingClimateChangeDetailMobile';

  TaclingClimateChangeDetailMobile({Key? key, }) : super(key: key);

  @override
  State<TaclingClimateChangeDetailMobile> createState() => _TaclingClimateChangeDetailMobileState();
}

class _TaclingClimateChangeDetailMobileState extends State<TaclingClimateChangeDetailMobile> {
  String? TaclingItemsId;
  bool transTacling=true;

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
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: mainColor,
            size: 25,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Center(
          child: Text(
            transTacling ? "Tacling Climate" : "التعامل مع المناخ",
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
              color: mainColor,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.language_sharp,
              color: mainColor,
              size: 25,
            ),
            onPressed: () {
              setState(() {
                transTacling = !transTacling;
              });
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.all(height * 0.020),
            width: width * 0.90,
            height: height * 0.40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  loadItems.image2!,
                ),
              ),
            ),
          ),
          SizedBox(
            height: height*0.02,
          ),
          Container(
            width:width,
            height: height*0.45,
            padding: EdgeInsets.all(width*0.030),
            color: Colors.green[100],
            child: Column(
              children: [
                Text(
                  loadItems.title!,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(
                      color: mainColor,
                      fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(
                  height: height*0.02,
                ),
                Text(
                  loadItems.description!,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2!
                      .copyWith(
                    color: Colors.grey[800],
                  ),
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(height * 0.020),
            width: width * 0.90,
            height: height * 0.40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  loadItems.image3!,
                ),
              ),
            ),
          ),
          SizedBox(
            height: height*0.02,
          ),
          Container(
            width:width,
            height: height*0.45,
            padding: EdgeInsets.all(width*0.030),
            color: Colors.green[100],
            child: ListView(
              children: [
                Text(
                  loadItems.title2!,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(
                      color: mainColor,
                      fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(
                  height: height*0.02,
                ),
                Text(
                  loadItems.description3!,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2!
                      .copyWith(
                    color: Colors.grey[800],
                  ),
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(height * 0.020),
            width: width * 0.90,
            height: height * 0.40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  loadItems.image4!,
                ),
              ),
            ),
          ),
          SizedBox(
            height: height*0.02,
          ),
          Container(
            width:width,
            height: height*0.45,
            padding: EdgeInsets.all(width*0.030),
            color: Colors.green[100],
            child: ListView(
              children: [
                Text(
                  loadItems.title3!,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(
                      color: mainColor,
                      fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(
                  height: height*0.02,
                ),
                Text(
                  loadItems.description4!,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2!
                      .copyWith(
                    color: Colors.grey[800],
                  ),
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}