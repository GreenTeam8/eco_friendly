import 'package:eco_friendly/controller/climate_change_controller.dart';
import 'package:eco_friendly/helpers/constants.dart';
import 'package:eco_friendly/helpers/size_config.dart';
import 'package:eco_friendly/view/drawer/web/climate_change_web.dart';
import 'package:eco_friendly/view/drawer/web/tacling_climate_details_web.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TaclingClimateWidget extends StatefulWidget {
  int index;
  TaclingClimateWidget({ required this.index,Key? key}) : super(key: key);

  @override
  State<TaclingClimateWidget> createState() => _TaclingClimateWidgetState();
}
class _TaclingClimateWidgetState extends State<TaclingClimateWidget> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.screenWidth!;
    double height = SizeConfig.screenHeight!;
    final taclingClimate = Provider.of<ClimateChangeController>(context, listen: false);
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          TaclingClimateChangeDetailWeb.TACLING_CLIMATE_DETAILS_WEB_ROUTE_NAME, arguments:
        {'Id': taclingClimate.getTacklingClimateList[widget.index].Id},);
      },
      child: Container(
        height: height*0.10,
        width: width*0.176,
        padding: EdgeInsets.all(height*0.040),
        margin: EdgeInsets.only(
          left: width*0.010,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.green[300],
        ),
        child: Column(
          children: [
            Container(
              height: height*0.10 ,
              width: width*0.10 ,
              decoration: BoxDecoration(
                image:DecorationImage(
                  image:NetworkImage(
                    taclingClimate.getTacklingClimateList[widget.index].image!,
                  ),
                  fit: BoxFit.contain,
                ),),
            ),
            SizedBox(
              height: height*0.020,
            ),
            Center(
              child: Text(
                transWeb?taclingClimate.getTacklingClimateList[widget.index].title!:taclingClimate.getTacklingClimateList[widget.index].titleAr!,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(
                    color: Colors.grey[800],
                    fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // SizedBox(
            //   height: height*0.020,
            // ),
            // Text(
            //   taclingClimate.getTacklingClimateList[widget.index].description!,
            //   style: Theme.of(context)
            //       .textTheme
            //       .bodyMedium!
            //       .copyWith(
            //     color: Colors.grey[800],
            //   ),
            //   textAlign: TextAlign.justify,
            // ),
          ],
        ),
      ),
    );
  }
}
