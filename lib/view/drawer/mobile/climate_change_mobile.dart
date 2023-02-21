import 'package:eco_friendly/controller/climate_change_controller.dart';
import 'package:eco_friendly/helpers/constants.dart';
import 'package:eco_friendly/helpers/size_config.dart';
import 'package:eco_friendly/view/drawer/drawer_widget/climate_change_widget.dart';
import 'package:eco_friendly/view/drawer/mobile/climate_change_carosel.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class ClimateChangeMobile extends StatefulWidget {
  ClimateChangeMobile({Key? key}) : super(key: key);

  @override
  State<ClimateChangeMobile> createState() => _ClimateChangeMobileState();
}

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
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: mColor,
          leading:  IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: 25,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Center(
            child: Text(
              "Fight for Green",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Colors.white,
                // fontWeight: FontWeight.bold,
              ),
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.language_sharp),
              color: Colors.white,
              onPressed: () {},
            ),
          ],
        ),
        body: FutureBuilder(
            future: _caroelChange,
            builder: (context, snapshot) {
              if(snapshot.connectionState == ConnectionState.waiting){
                return Center(child: Lottie.asset('assets/lottie/loading.json', height: height * 0.2),);
              }else{
                return  ListView(
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    Column(
                      children: [
                        Container(
                          height: height*0.30,
                          // width: width*0.90,
                          child:ClimateChangeCarosel(),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Climate Issues",
                                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                  color: mainColor,
                                  // fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                          FutureBuilder(
                              future: _climateChange,
                              builder: (context, snapshot) {
                                return Container(
                                  // width: width,
                                  height: height*0.55 ,
                                  child: GridView.builder(
                                    itemCount: ClimateChangeData.getClimateChangeList.length,
                                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      childAspectRatio: 3 / 2,
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
                                );
                              }
                          ),
                      ],
                    ),
                  ],
                );
              }
            }),
       
      ),
    );
  }
}
