import 'package:eco_friendly/controller/climate_change_controller.dart';
import 'package:eco_friendly/helpers/constants.dart';
import 'package:eco_friendly/helpers/responsive.dart';
import 'package:eco_friendly/helpers/size_config.dart';
import 'package:eco_friendly/view/drawer/drawer_widget/egypt_contribution_widget_web.dart';
import 'package:eco_friendly/view/drawer/mobile/egypt_contribution_mobile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../mobile/climate_voices.dart';

class  EgyptContributionWeb extends StatefulWidget {
  const EgyptContributionWeb({Key? key}) : super(key: key);

  @override
  State<EgyptContributionWeb> createState() => _EgyptContributionWebState();
}
bool EygTransWed =true;
class _EgyptContributionWebState extends State<EgyptContributionWeb> {
  Future? _egyptContribution;
  Future _egyptContributionItems (){
    return Provider.of<ClimateChangeController>(context, listen: false).fetchEgyptContribution();
  }
  @override
  void initState() {
    _egyptContribution = _egyptContributionItems();
    // _controller=ScrollController();
    super.initState();
  }
  final ScrollController _controller=ScrollController();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.screenWidth!;
    double height = SizeConfig.screenHeight!;
    final EgyptContributionData = Provider.of<ClimateChangeController>(context);
    final  EgyptContribution = EgyptContributionData.getEgyptContributionList;
    return Responsive.isWeb(context)
        ? WillPopScope(
      onWillPop: ()async=>true,
      child: Scaffold(
        body: FutureBuilder(
          future: _egyptContribution,
          builder: (context, snapshot) {
            if (snapshot.connectionState ==
                ConnectionState.waiting) {
              return Center(
                child: Text(''),
              );
            } else {
              return ListView(
                children: [
                  Container(
                    alignment: Alignment.topRight,
                    height: height * 0.65,
                    width: width*0.90,
                    padding: EdgeInsets.all(height*0.02),
                    margin: EdgeInsets.all(height*0.02),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image:DecorationImage(
                        image:AssetImage('assets/images/egy.jpg',),
                        fit: BoxFit.fill,
                      ),

                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.language_sharp,
                        color: Colors.green,
                        size: width*0.020,
                      ),
                      onPressed: () {
                        setState(() {
                          EygTransWed=!EygTransWed;
                        });
                      },
                    ),
                  ),
                  SizedBox(height: height*0.030,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: width,
                        height: height*0.90,
                        child: ListView.builder(
                          controller: _controller,
                          scrollDirection: Axis.horizontal,
                          // physics: NeverScrollableScrollPhysics(),
                          itemCount: EgyptContributionData.getEgyptContributionList.length,
                          itemBuilder: (Context,index) {
                            return ChangeNotifierProvider.value(
                                value: EgyptContribution[index],
                                child: EgyptContributionWidgetWeb(index: index));
                          },
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding:EdgeInsets.all(width*0.010),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundColor: mColor,
                          child: IconButton(
                            onPressed:(){
                              _controller.animateTo(
                                _controller.position.minScrollExtent,
                                duration:Duration(milliseconds: 1000) ,
                                curve:Curves.decelerate,
                              );
                            },
                            icon: Icon(
                                Icons.arrow_back_ios_new_outlined,
                              color: Colors.white,
                            ),),
                        ),
                        SizedBox(width: width*0.80,),
                        CircleAvatar(
                          backgroundColor: mColor,
                          child: IconButton(
                              onPressed:(){
                                _controller.animateTo(
                                _controller.position.maxScrollExtent,
                                duration:Duration(milliseconds: 1000) ,
                                curve:Curves.decelerate,
                                );
                              },
                              icon: Icon(
                                Icons.arrow_forward_ios_outlined,
                                color: Colors.white,
                              ),),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }
          },
        ),

      ),
    )
        :EgyptContributionMobile();

  }
}