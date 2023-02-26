import 'package:eco_friendly/helpers/constants.dart';
import 'package:flutter/material.dart';

import '../../../helpers/size_config.dart';

class ClimateGoal extends StatelessWidget {
  const ClimateGoal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.screenWidth!;
    double height = SizeConfig.screenHeight!;
    return Container(

      padding: EdgeInsets.symmetric(horizontal: width * 0.01),
      height: height * 0.3,
      decoration: BoxDecoration(
       color: mColor.withOpacity(0.9)
      ),
      child: Row(
       mainAxisAlignment: MainAxisAlignment.spaceBetween,
       crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          RichText(
            text: TextSpan(
              text: 'Things to do: \n',
              style: Theme.of(context).textTheme.bodyText2!.
              copyWith(
                fontWeight: FontWeight.bold,
                color: mainColor,
              ),
              children:[
                TextSpan(text: 'Buy eco-friendly products.\n',
                    style: Theme.of(context).textTheme.bodyText2!.
                    copyWith(
                        //fontWeight: FontWeight.bold,
                        color: Colors.white,
                    ),),
                TextSpan(text: 'Offset your carbon emissions.\n',
                  style: Theme.of(context).textTheme.bodyText2!.
                  copyWith(
                    //fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),),
                TextSpan(text: 'Reduce your plastic waste.\n',
                  style: Theme.of(context).textTheme.bodyText2!.
                  copyWith(
                    //fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),),
                TextSpan(text: 'Awareness-raising.\n',
                  style: Theme.of(context).textTheme.bodyText2!.
                  copyWith(
                    //fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),),

              ],
            ),
          ),
          Image.asset('assets/images/sustainable_climate.png',
              width:  width * 0.30,
              height: height,
              fit: BoxFit.contain),
        ],
      ),
    );
  }
}
