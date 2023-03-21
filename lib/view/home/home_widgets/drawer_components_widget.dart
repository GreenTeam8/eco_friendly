
import 'package:eco_friendly/view/drawer/mobile/climate_voices.dart';
import 'package:eco_friendly/view/drawer/web/climate_change_web.dart';
import 'package:eco_friendly/view/drawer/web/climate_voice_web.dart';
import 'package:flutter/material.dart';


import '../../../helpers/constants.dart';
import '../../../helpers/size_config.dart';
import 'drawer_items_widget.dart';

class DrawerComponentsWidget extends StatelessWidget {
  const DrawerComponentsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    //double width = SizeConfig.screenWidth!;
    double height = SizeConfig.screenHeight!;

    return Container(
      padding: EdgeInsets.all(height * 0.01),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: mainColor)),
      child: Column(
        children: [
          SideItemsWidget(
              icon: Icons.snowing, text: 'Climate Change', onTap: () {
                // context.go('/page2');
            Navigator.push(context,
                MaterialPageRoute(
                    builder: (context) =>
                        ClimateChangeWeb()));
          }),
          SizedBox(
            height: height * 0.04,
          ),
          SideItemsWidget(
              icon: Icons.task_alt, text: 'Egypt Contribution', onTap: () {}),
          SizedBox(
            height: height * 0.04,
          ),
          SideItemsWidget(icon: Icons.vertical_split, text: 'Voices of Change ', onTap: () {
            Navigator.push(context,
                MaterialPageRoute(
                    builder: (context) =>
                        ClimateVoicesWeb()));
          }),
          SizedBox(
            height: height * 0.04,
          ),
        ],
      ),
    );
  }
}
