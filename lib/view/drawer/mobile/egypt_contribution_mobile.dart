import 'package:eco_friendly/controller/climate_change_controller.dart';
import 'package:eco_friendly/helpers/constants.dart';
import 'package:eco_friendly/helpers/size_config.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../drawer_widget/egypt_contribution_widget_mobile.dart';

class EgyptContributionMobile extends StatefulWidget {
  const EgyptContributionMobile({Key? key}) : super(key: key);

  @override
  State<EgyptContributionMobile> createState() =>
      _EgyptContributionMobileState();
}

bool EygTrans = true;

class _EgyptContributionMobileState extends State<EgyptContributionMobile> {
  Future? _egyptContribution;
  Future _egyptContributionItems() {
    return Provider.of<ClimateChangeController>(context, listen: false)
        .fetchEgyptContribution();
  }

  @override
  void initState() {
    _egyptContribution = _egyptContributionItems();
    super.initState();
  }

  final ScrollController _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.screenWidth!;
    double height = SizeConfig.screenHeight!;
    final EgyptContributionData = Provider.of<ClimateChangeController>(context);
    final EgyptContribution = EgyptContributionData.getEgyptContributionList;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: mainColor,
            size: 25,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Center(
          child: Text(
            EygTrans ? "Contribution" : "المساهمة",
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  color: mainColor,
                ),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.language_sharp,
              color: mainColor,
              size: 25,
            ),
            onPressed: () {
              setState(() {
                EygTrans = !EygTrans;
              });
            },
          ),
        ],
      ),
      body: FutureBuilder(
        future: _egyptContribution,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Lottie.asset('assets/lottie/loading.json',
                  height: height * 0.2),
            );
          } else {
            return Container(
              width: width,
              height: height * 0.90,
              child: ListView.builder(
                controller: _controller,
                itemCount:
                    EgyptContributionData.getEgyptContributionList.length,
                itemBuilder: (Context, index) {
                  return ChangeNotifierProvider.value(
                      value: EgyptContribution[index],
                      child: EgyptContributionWidgetMobile(index: index));
                },
              ),
            );
          }
        },
      ),
    );
  }
}
