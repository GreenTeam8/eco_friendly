import 'package:eco_friendly/constants.dart';
import 'package:flutter/material.dart';

import '../../../../../size_config.dart';
import 'drawer_items.dart';


class DrawerComponents extends StatelessWidget {
  const DrawerComponents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.screenWidth!;
    double height = SizeConfig.screenHeight!;

    return Container(
      padding:  EdgeInsets.all(height * 0.01),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              color: kPC
          )
      ),
      child: Column(
        children: [
          SideItems(icon: Icons.snowing,text: 'Climate Change',onTap: (){}),
          SizedBox(height: height * 0.04,),
          SideItems(icon: Icons.task_alt,text: 'Egypt Contribution',onTap: (){}),
          SizedBox(height: height * 0.04,),
          SideItems(icon: Icons.newspaper,text: 'News',onTap: (){}),
          SizedBox(height: height * 0.04,),
        ],
      ),
    );
  }
}


