
import 'package:eco_friendly/controller/climate_change_controller.dart';

import 'package:eco_friendly/helpers/size_config.dart';

import 'package:eco_friendly/view/drawer/web/climate_change_details_web.dart';
import 'package:eco_friendly/view/drawer/web/climate_change_web.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ClimateChangeWebWidget extends StatefulWidget {
  int index;
  ClimateChangeWebWidget({ required this.index,Key? key}) : super(key: key);

  @override
  State<ClimateChangeWebWidget> createState() => _ClimateChangeWebWidgetState();
}

class _ClimateChangeWebWidgetState extends State<ClimateChangeWebWidget> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.screenWidth!;
    double height = SizeConfig.screenHeight!;
    final climateChanges = Provider.of<ClimateChangeController>(context, listen: false);
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          ClimateChangeDetailWeb.CLIMATE_DETAILS_WEB_ROUTE_NAME, arguments:
          {'Id': climateChanges.getClimateChangeList[widget.index].Id},);
      },
      child: Container(
        alignment:Alignment.center,
        width: width,
        height: height,
        margin: EdgeInsets.all(height * 0.01),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image:NetworkImage(
              climateChanges.getClimateChangeList[widget.index].image!,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          width: width,
          height: height,
          padding: EdgeInsets.all(10),
          child: Text(
            transWeb?climateChanges.getClimateChangeList[widget.index].name!:climateChanges.getClimateChangeList[widget.index].nameAr!,
            style: Theme.of(context)
                .textTheme
                .bodyText2!
                .copyWith(
              color: Colors.white,

              // fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
