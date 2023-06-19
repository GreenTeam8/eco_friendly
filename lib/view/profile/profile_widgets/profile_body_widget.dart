

import 'package:eco_friendly/helpers/constants.dart';
import 'package:flutter/material.dart';

import '../../../helpers/size_config.dart';

class ProfileBodyWidget extends StatelessWidget {
  final IconData? iconSrc;
  final String? title;
  final VoidCallback? onPress;

  ProfileBodyWidget({Key? key,  this.iconSrc,  this.title, this.onPress,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double height = SizeConfig.screenHeight!;
    double width = SizeConfig.screenWidth!;
    return InkWell(
      onTap: onPress,
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: width * 0.04, vertical: height * 0.02),
        child: SafeArea(
          child: Row(
            children: [
              Icon(iconSrc, color: mainColor,),
              SizedBox(width: width * 0.05,),
              Text(title!, style: Theme.of(context).textTheme.bodyText2!.copyWith(color: mainColor),),
              Spacer(),
              //Icon(Icons.arrow_forward_ios,  color: mainColor,)
            ],
          ),
        ),
      ),
    );
  }
}