import 'package:eco_friendly/controller/climate_change_controller.dart';
import 'package:eco_friendly/helpers/size_config.dart';
import 'package:eco_friendly/view/drawer/drawer_widget/tacling_climate_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../drawer_widget/tacling_climate_mobile_widget.dart';

class TaclingClimateMobile extends StatefulWidget {
  const TaclingClimateMobile({Key? key}) : super(key: key);

  @override
  State<TaclingClimateMobile> createState() => _TaclingClimateMobileState();
}
bool transTacling=true;
class _TaclingClimateMobileState extends State<TaclingClimateMobile> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.screenWidth!;
    double height = SizeConfig.screenHeight!;
    final TaclingClimateData = Provider.of<ClimateChangeController>(context);
    final taclingClimate = TaclingClimateData.getTacklingClimateList;
    return  Container(
      height:height ,
      width: width*0.98 ,
      child:ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: TaclingClimateData.getTacklingClimateList.length,
        itemBuilder: (context, index) {
          return ChangeNotifierProvider.value(
              value: taclingClimate[index],
              child: TaclingClimateMobileWidget(index: index));
        },
      ),
    );
  }
}
