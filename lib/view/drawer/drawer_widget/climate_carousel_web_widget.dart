import 'package:eco_friendly/controller/climate_change_controller.dart';
import 'package:eco_friendly/helpers/size_config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WebCarosileWidget extends StatefulWidget {
  int index;
  WebCarosileWidget({required this.index, Key? key}) : super(key: key);

  @override
  State<WebCarosileWidget> createState() => _WebCarosileWidgetState();
}

class _WebCarosileWidgetState extends State<WebCarosileWidget> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.screenWidth!;
    double height = SizeConfig.screenHeight!;
    final climateCarosel =
    Provider.of<ClimateChangeController>(context, listen: false);
    return Container(
      width: width,
      height: height * 0.50,
      // margin: EdgeInsets.all(height * 0.01),
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
          climateCarosel.getClimateCaroselList[widget.index].description!,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
