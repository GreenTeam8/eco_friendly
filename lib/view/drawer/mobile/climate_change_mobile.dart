import 'package:eco_friendly/controller/climate_change_controller.dart';
import 'package:eco_friendly/helpers/constants.dart';
import 'package:eco_friendly/helpers/constants.dart';
import 'package:eco_friendly/helpers/constants.dart';
import 'package:eco_friendly/helpers/size_config.dart';
import 'package:eco_friendly/view/drawer/drawer_widget/climate_change_mobile_widget.dart';
import 'package:eco_friendly/view/drawer/mobile/climate_change_carosel.dart';
import 'package:eco_friendly/view/drawer/mobile/tacling_climate_mobile.dart';
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
              return ListView(
                children: [
                  Container(
                    height: height*0.30,
                    // width: width*0.90,
                    child:ClimateChangeCarosel(),
                  ),
                  Padding(
                    padding: EdgeInsets.all(width*0.015),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          transs? "Climate Issues":"قضاياالمناخ",
                          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: mainColor,
                            // fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                    Container(
                      // width: width,
                      height: height *0.50,
                      decoration: BoxDecoration(
                      ),
                      child: GridView.builder(
                        itemCount: ClimateChangeData.getClimateChangeList.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 3/2.3,
                          crossAxisSpacing: 5,
                          mainAxisSpacing: 3,
                        ),
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return ChangeNotifierProvider.value(
                              value: climateChange[index],
                              child: ClimateChangeWidget(index: index));
                        },
                      ),
                    ),
                  Padding(
                    padding: EdgeInsets.all(width*0.015),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          transs? "Tacling Climate Change":"التعامل مع تغير المناخ",
                          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: mainColor,
                            // fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.010),
                    height: height * 0.15,
                    width: width,
                    decoration: BoxDecoration(
                        color:mColor,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TaclingClimateMobile(),
                        // RichText(
                        //   text: TextSpan(
                        //     text: 'Things to do: \n',
                        //     style: Theme.of(context).textTheme.bodyText2!.
                        //     copyWith(
                        //       fontWeight: FontWeight.bold,
                        //       color: mainColor,
                        //     ),
                        //     children:[
                        //       TextSpan(text: 'Buy eco-friendly products.\n',
                        //         style: Theme.of(context).textTheme.bodyText2!.
                        //         copyWith(
                        //           //fontWeight: FontWeight.bold,
                        //           color: Colors.white,
                        //         ),),
                        //       TextSpan(text: 'Offset your carbon emissions.\n',
                        //         style: Theme.of(context).textTheme.bodyText2!.
                        //         copyWith(
                        //           //fontWeight: FontWeight.bold,
                        //           color: Colors.white,
                        //         ),),
                        //       TextSpan(text: 'Reduce your plastic waste.\n',
                        //         style: Theme.of(context).textTheme.bodyText2!.
                        //         copyWith(
                        //           //fontWeight: FontWeight.bold,
                        //           color: Colors.white,
                        //         ),),
                        //       TextSpan(text: 'Awareness-raising.\n',
                        //         style: Theme.of(context).textTheme.bodyText2!.
                        //         copyWith(
                        //           //fontWeight: FontWeight.bold,
                        //           color: Colors.white,
                        //         ),),
                        //
                        //     ],
                        //   ),
                        // ),
                        // Image.asset('assets/images/sustainable_climate.png',
                        //     width:  width * 0.30,
                        //     height: height,
                        //     fit: BoxFit.contain),
                      ],
                    ),
                  ),
                ],
              );
            }
          }),

    );
  }
}
