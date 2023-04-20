import 'package:eco_friendly/controller/climate_change_controller.dart';
import 'package:eco_friendly/helpers/size_config.dart';
import 'package:eco_friendly/view/drawer/mobile/climate_change_mobile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MobileCarosileWidget extends StatefulWidget {
  int index;
  MobileCarosileWidget({required this.index, Key? key}) : super(key: key);

  @override
  State<MobileCarosileWidget> createState() => _MobileCarosileWidgetState();
}

class _MobileCarosileWidgetState extends State<MobileCarosileWidget> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.screenWidth!;
    double height = SizeConfig.screenHeight!;
    final climateCarosel =
    Provider.of<ClimateChangeController>(context, listen: false);
    return Container(
      width: width,
      height: height * 0.30,
      margin: EdgeInsets.all(height * 0.01),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
            image: NetworkImage(
              climateCarosel.getClimateCaroselList[widget.index].image!,
            ),
            fit: BoxFit.fill,
      ),),
      child: Container(
        padding:EdgeInsets.only(
          left: 15,
          bottom: 15,
        ),
        alignment: Alignment.bottomLeft,
        height: height,
        width: width,
        child: Text(
          transs?climateCarosel.getClimateCaroselList[widget.index].description!:climateCarosel.getClimateCaroselList[widget.index].descriptionAr!,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
