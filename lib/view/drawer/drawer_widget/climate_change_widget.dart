import 'package:eco_friendly/controller/climate_change_controller.dart';
import 'package:eco_friendly/helpers/size_config.dart';
import 'package:eco_friendly/view/drawer/mobile/climate_change_details_mobile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
        Navigator.of(context)
            .pushNamed(
          ClimateChangeDetail.CLIMATE_DETAILS_ROUTE_NAME, arguments:
        {'Id': climateChange.getClimateChangeList[widget.index].Id
        },
        );
      },
      child: Container(
        alignment: Alignment.bottomLeft,
        width: width,
        height: height,
        margin: EdgeInsets.all(height * 0.01),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
                image:NetworkImage(
                  climateChange.getClimateChangeList[widget.index].image!,
                ),
                fit: BoxFit.cover,
    ),
        ),
        child:  Container(
          padding: EdgeInsets.all(10),
          child: Text(
            climateChange.getClimateChangeList[widget.index].name!,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
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
