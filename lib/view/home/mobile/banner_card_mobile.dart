import 'package:eco_friendly/view/home/home_widgets/banner_card_widget.dart';
import 'package:flutter/material.dart';

import '../../../helpers/size_config.dart';

class BannerCardMobile extends StatelessWidget {
  const BannerCardMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double height = SizeConfig.screenHeight!;
    //double width = SizeConfig.screenWidth!;
    return Container(
      height: height * 0.45,
      //pageview
      child: BannerCardWidget(),
    );
  }
}
