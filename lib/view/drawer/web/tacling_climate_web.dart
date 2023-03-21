import 'package:eco_friendly/controller/climate_change_controller.dart';
import 'package:eco_friendly/helpers/size_config.dart';
import 'package:eco_friendly/view/drawer/drawer_widget/tacling_climate_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TaclingClimateWeb extends StatefulWidget {
  const TaclingClimateWeb({Key? key}) : super(key: key);

  @override
  State<TaclingClimateWeb> createState() => _TaclingClimateWebState();
}

class _TaclingClimateWebState extends State<TaclingClimateWeb> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.screenWidth!;
    double height = SizeConfig.screenHeight!;
    final TaclingClimateData = Provider.of<ClimateChangeController>(context);
    final taclingClimate = TaclingClimateData.getTacklingClimateList;
    return  Container(
      height: height *0.10,
      width: width*0.10 ,
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: TaclingClimateData.getTacklingClimateList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5,
          childAspectRatio: 1.5/ 2.7,
          crossAxisSpacing: 5,
          // mainAxisSpacing: 5,
        ),
        itemBuilder: (context, index) {
          return ChangeNotifierProvider.value(
              value: taclingClimate[index],
              child: TaclingClimateWidget(index: index));
        },
      ),
    );
  }
}
