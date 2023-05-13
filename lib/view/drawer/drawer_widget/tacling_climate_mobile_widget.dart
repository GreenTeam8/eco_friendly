import 'package:eco_friendly/controller/climate_change_controller.dart';
import 'package:eco_friendly/helpers/size_config.dart';
import 'package:eco_friendly/view/drawer/mobile/tacling_climate_details_mobile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TaclingClimateMobileWidget extends StatefulWidget {
  int index;
  TaclingClimateMobileWidget({ required this.index,Key? key}) : super(key: key);

  @override
  State<TaclingClimateMobileWidget> createState() => _TaclingClimateMobileWidgetState();
}
class _TaclingClimateMobileWidgetState extends State<TaclingClimateMobileWidget> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.screenWidth!;
    double height = SizeConfig.screenHeight!;
    final taclingClimate = Provider.of<ClimateChangeController>(context, listen: false);
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          TaclingClimateChangeDetailMobile.TACLING_CLIMATE_DETAILS_MOBILE_ROUTE_NAME, arguments:
        {'Id': taclingClimate.getTacklingClimateList[widget.index].Id},);
      },
      child: Container(
        height: height*0.15,
        width: width*0.20,
        // padding: EdgeInsets.all(height*0.040),
        // margin: EdgeInsets.only(
        //   left: width*0.010,
        // ),
        // decoration: BoxDecoration(
        //   borderRadius: BorderRadius.circular(10),
        //   color: Colors.green[300],
        // ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: height*0.050,
              backgroundColor: Colors.grey[100],
              child: Container(
                height: height*0.10 ,
                width: width*0.10,
                decoration: BoxDecoration(
                  image:DecorationImage(
                    image:NetworkImage(
                      taclingClimate.getTacklingClimateList[widget.index].image!,
                    ),
                    fit: BoxFit.contain,
                  ),),
              ),
            ),
            // SizedBox(
            //   height: height*0.020,
            // ),
          ],
        ),
      ),
    );
  }
}
