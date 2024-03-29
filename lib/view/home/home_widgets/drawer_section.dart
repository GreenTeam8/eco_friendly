import 'package:eco_friendly/helpers/constants.dart';
import 'package:flutter/material.dart';


import '../../../helpers/size_config.dart';
import 'drawer_components_widget.dart';
import 'help_center.dart';

class DrawerSection extends StatelessWidget {

  const DrawerSection({
    Key? key,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double height = SizeConfig.screenHeight!;
    //double width = SizeConfig.screenWidth!;
          //const HelpCenter(),
    return SafeArea(
      child: Container(
        height: height,

        //color: mColor.withOpacity(0.3),
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/images/eco-friendly_planet.png'),
            Text(
              'Stay Aware!',
              style: Theme.of(context).textTheme.bodyText1,
            ),

            SizedBox(
              height: height * 0.02,
            ),
            const DrawerComponentsWidget(),
            SizedBox(
              height: height * 0.02,
            ),

            //Spacer(),
            //const HelpCenter(),

          ],
        ),
      ),
    );
  }
}