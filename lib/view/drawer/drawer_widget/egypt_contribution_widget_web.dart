import 'package:eco_friendly/controller/climate_change_controller.dart';
import 'package:eco_friendly/helpers/constants.dart';
import 'package:eco_friendly/helpers/size_config.dart';
import 'package:eco_friendly/view/drawer/web/egypt_contribution_web.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../web/climate_voice_web.dart';

class EgyptContributionWidgetWeb extends StatefulWidget {
  int index;
  EgyptContributionWidgetWeb({ required this.index,Key? key}) : super(key: key);

  @override
  State<EgyptContributionWidgetWeb> createState() => _EgyptContributionWidgetWebState();
}

class _EgyptContributionWidgetWebState extends State<EgyptContributionWidgetWeb> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.screenWidth!;
    double height = SizeConfig.screenHeight!;
    final EgyptContribution = Provider.of<ClimateChangeController>(context, listen: false);
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              width:width* 0.40,
              height: height*0.25,
              decoration: BoxDecoration(
                  color: Colors.green[400],
                  ),
              padding: EdgeInsets.all(10),
              child:  Center(
                child: Text(
                  EygTransWed?'Contributions'!:"المساهمات"!,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
            Container(
              width:width* 0.40,
              height: height*0.60,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: mainColor,
                  ),
                   ),
              // padding: EdgeInsets.all(height*0.010),
              child: ListView(
                physics: NeverScrollableScrollPhysics(),
                children: [
                  Padding(
                    padding: EdgeInsets.all(height*0.020),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width:width* 0.45,
                          height: height*0.46,
                          child: Column(
                            children: [
                              Text(
                                EygTransWed?EgyptContribution.getEgyptContributionList[widget.index].title!:EgyptContribution.getEgyptContributionList[widget.index].titleAr!,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2!
                                    .copyWith(
                                    color: mainColor,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              SizedBox(
                                height: height*0.02,
                              ),
                              Text(
                                EygTransWed?EgyptContribution.getEgyptContributionList[widget.index].Description!:EgyptContribution.getEgyptContributionList[widget.index].DescriptionAr!,
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
                        SizedBox(
                          height: height*0.02,
                        ),
                        ElevatedButton(
                          onPressed: (){},
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.green),
                            padding: MaterialStateProperty.all(
                              EdgeInsets.all(height*0.020),
                            ),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(height*0.010),
                              ),
                            ),
                          ),

                          child: Text(
                            EygTransWed?"Show More"!:'المزيد'!,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(
                                color: kCanvas,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Container(
          height: height*0.80,
          width: width*0.60,
          child: Column(
            children: [
              Container(
                height: height*0.080,
                width: width*0.60,
                color: mColor,
              ),
              Container(
                width: width*0.40,
                height: height*0.50,
                margin: EdgeInsets.all(height * 0.10),
                decoration: BoxDecoration(
                  borderRadius:BorderRadius.circular(20),
                  image: DecorationImage(
                    image:NetworkImage(
                      EgyptContribution.getEgyptContributionList[widget.index].image!,
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
