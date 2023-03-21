import 'package:eco_friendly/controller/climate_change_controller.dart';
import 'package:eco_friendly/helpers/constants.dart';
import 'package:eco_friendly/helpers/constants.dart';
import 'package:eco_friendly/helpers/constants.dart';
import 'package:eco_friendly/helpers/size_config.dart';
import 'package:eco_friendly/view/drawer/drawer_widget/climate_change_mobile_widget.dart';
import 'package:eco_friendly/view/drawer/mobile/climate_change_carosel.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class ClimateChangeMobile extends StatefulWidget {
  ClimateChangeMobile({Key? key}) : super(key: key);

  @override
  State<ClimateChangeMobile> createState() => _ClimateChangeMobileState();
}
bool transs=true;
class _ClimateChangeMobileState extends State<ClimateChangeMobile> {
  Future? _caroelChange;
  Future? _climateChange;
  Future _climateChangeItem (){
    return Provider.of<ClimateChangeController>(context, listen: false).fetchClimateChange();
  }
  Future _caroselItems (){
    return Provider.of<ClimateChangeController>(context, listen: false).fetchcaroselSlider();
  }

  @override
  void initState() {
    _climateChange = _climateChangeItem();
    _caroelChange = _caroselItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.screenWidth!;
    double height = SizeConfig.screenHeight!;
    final ClimateChangeData = Provider.of<ClimateChangeController>(context);
    final climateChange = ClimateChangeData.getClimateChangeList;
    return Scaffold(
      appBar: AppBar(
        leading:  IconButton(
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
           transs? "Climate Issues":"قضاياالمناخ",
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
              color:mainColor,
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
               transs=!transs;
             });
            },
          ),
          ],
      ),
      body: FutureBuilder(
          future: _climateChange,
          builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting){
              return Center(child: Lottie.asset('assets/lottie/loading.json', height: height * 0.2),);
            }else{
              return  ListView(
                physics: NeverScrollableScrollPhysics(),
                children: [
                  Column(
                    children: [
                      // Container(
                      //   height: height*0.30,
                      //   // width: width*0.90,
                      //   child:ClimateChangeCarosel(),
                      // ),
                      // Padding(
                      //   padding: const EdgeInsets.all(8.0),
                      //   child: Row(
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     children: [
                      //       Text(
                      //         "Climate Issues",
                      //         style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      //           color: mainColor,
                      //           // fontWeight: FontWeight.bold,
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                        Container(
                          // width: width,
                          height: height*0.90 ,
                          child: GridView.builder(
                            itemCount: ClimateChangeData.getClimateChangeList.length,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 1,
                              childAspectRatio: 4 /2.5,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                            ),
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) {
                              return ChangeNotifierProvider.value(
                                  value: climateChange[index],
                                  child: ClimateChangeWidget(index: index));
                            },
                          ),
                        ),
                    ],
                  ),
                ],
              );
            }
          }),

    );
  }
}
