import 'package:eco_friendly/constants.dart';
import 'package:flutter/material.dart';

import '../../../size_config.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double height = SizeConfig.screenHeight! ;
    double width = SizeConfig.screenWidth! ;
    final controller = TextEditingController();
    return Container(
      margin: EdgeInsets.symmetric(horizontal: kMargin),
      height: height * 0.1,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: kSecondaryColor.withOpacity(0.2)
      ),

        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            border: InputBorder.none,
            suffixIcon: Icon(Icons.search),
            labelText: ' Search',
          ),
        ),

    );
  }
}
