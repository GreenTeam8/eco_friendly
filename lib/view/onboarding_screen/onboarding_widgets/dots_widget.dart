import '../../../helpers/constants.dart';
import '../../../helpers/size_config.dart';
import 'package:flutter/material.dart';

class DotsBuilder extends StatelessWidget {

  int? listIndex;
  int? currentIndex;
   DotsBuilder({this.listIndex,this.currentIndex, Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double height = SizeConfig.screenHeight!;

    return Container(
      height:  height * 0.015,
      width: currentIndex == listIndex ? 25 : 10,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: mColor
      ),
    );
  }
}