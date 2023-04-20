import 'package:eco_friendly/controller/climate_change_controller.dart';
import 'package:eco_friendly/helpers/constants.dart';
import 'package:eco_friendly/helpers/size_config.dart';
import 'package:eco_friendly/view/drawer/mobile/climate_change_details_mobile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../mobile/climate_change_mobile.dart';

class ClimateChangeWidget extends StatefulWidget {
  int index;
  ClimateChangeWidget({ required this.index,Key? key}) : super(key: key);

  @override
  State<ClimateChangeWidget> createState() => _ClimateChangeWidgetState();
}

class _ClimateChangeWidgetState extends State<ClimateChangeWidget> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.screenWidth!;
    double height = SizeConfig.screenHeight!;
    final climateChange = Provider.of<ClimateChangeController>(context, listen: false);
    return GestureDetector(
      onTap: () {
          Navigator.of(context).pushNamed(
            ClimateChangeDetailMobil.CLIMATE_DETAILS_MOBILE_ROUTE_NAME, arguments:
          {'Id': climateChange.getClimateChangeList[widget.index].Id},);
      },
      child:Container(
        width: width*0.50,
        height: height*0.50,
        margin: EdgeInsets.all(height * 0.015),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image:NetworkImage(
              climateChange.getClimateChangeList[widget.index].image!,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          width: width*0.55,
          height: height*0.20,
          alignment: Alignment.bottomCenter,
          padding: EdgeInsets.all(10),
          child: Text(
            transs?climateChange.getClimateChangeList[widget.index].name!: climateChange.getClimateChangeList[widget.index].nameAr!,
            style: Theme.of(context)
                .textTheme
                .bodyText2!
                .copyWith(
              color: Colors.grey[100],

              // fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
