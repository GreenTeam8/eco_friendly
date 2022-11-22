import 'package:flutter/material.dart';

import '../../../size_config.dart';
import 'drawer_components.dart';
import 'help_center_web.dart';

class DrawerSection extends StatelessWidget {

  const DrawerSection({
    Key? key,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double height = SizeConfig.screenHeight!;
    double width = SizeConfig.screenWidth!;

    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Stay Aware!',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          SizedBox(
            height: height * 0.02,
          ),
          const DrawerComponents(),
          SizedBox(
            height: height * 0.02,
          ),
          const HelpCenter(),
        ],
      ),
    );
  }
}