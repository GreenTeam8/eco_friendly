import 'package:eco_friendly/controller/climate_change_controller.dart';
import 'package:eco_friendly/helpers/constants.dart';
import 'package:eco_friendly/helpers/size_config.dart';
import 'package:eco_friendly/view/drawer/mobile/egypt_contribution_mobile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EgyptContributionWidgetMobile extends StatefulWidget {
  int index;
  EgyptContributionWidgetMobile({required  this.index,Key? key}) : super(key: key);

  @override
  State<EgyptContributionWidgetMobile> createState() => _EgyptContributionWidgetMobileState();
}

class _EgyptContributionWidgetMobileState extends State<EgyptContributionWidgetMobile> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.screenWidth!;
    double height = SizeConfig.screenHeight!;
    final EgyptContribution = Provider.of<ClimateChangeController>(context, listen: false);
    return Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          margin: EdgeInsets.only(top: height * 0.020),
          width: width * 0.90,
          height: height * 0.40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(
                EgyptContribution.getEgyptContributionList[widget.index].image!,
              ),
            ),
          ),
        ),
        SizedBox(
          height: height*0.02,
        ),
        Container(
          width:width,
          height: height*0.45,
          padding: EdgeInsets.all(width*0.030),
          color: Colors.green[100],
          child: Column(
            children: [
              Text(
                EygTrans?EgyptContribution.getEgyptContributionList[widget.index].title!:EgyptContribution.getEgyptContributionList[widget.index].titleAr!,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(
                    color: mainColor,
                    fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(
                height: height*0.02,
              ),
              Text(
                EygTrans?EgyptContribution.getEgyptContributionList[widget.index].Description!:EgyptContribution.getEgyptContributionList[widget.index].DescriptionAr!,
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(
                  color: Colors.grey[800],
                ),
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
      ],
    );

  }
}
