import 'package:card_swiper/card_swiper.dart';
import 'package:eco_friendly/controller/climate_change_controller.dart';
import 'package:eco_friendly/helpers/constants.dart';
import 'package:eco_friendly/helpers/responsive.dart';
import 'package:eco_friendly/helpers/size_config.dart';
import 'package:eco_friendly/view/drawer/drawer_widget/voice_of_change_widget.dart';
import 'package:eco_friendly/view/drawer/drawer_widget/voice_of_change_widget_web.dart';
import 'package:eco_friendly/view/drawer/mobile/climate_voices.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class  ClimateVoicesWeb extends StatefulWidget {
  const ClimateVoicesWeb({Key? key}) : super(key: key);

  @override
  State<ClimateVoicesWeb> createState() => _ClimateVoicesWebState();
}
bool LangWeb=true;
class _ClimateVoicesWebState extends State<ClimateVoicesWeb> {
  Future? _climateVoices;
  Future _climateVoicesItems (){
    return Provider.of<ClimateChangeController>(context, listen: false).fetchVoiceOfChange();
  }

  @override
  void initState() {
    _climateVoices = _climateVoicesItems();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.screenWidth!;
    double height = SizeConfig.screenHeight!;
    final VoicesOfChangeData = Provider.of<ClimateChangeController>(context);
    final  VoiceOfChange = VoicesOfChangeData.getVoiceOfChangeList;
    return Responsive.isWeb(context)
        ? WillPopScope(
      onWillPop: ()async=>true,
      child: Scaffold(
        body: FutureBuilder(
          future: _climateVoices,
          builder: (context, snapshot) {
            if (snapshot.connectionState ==
                ConnectionState.waiting) {
              return Center(
                child: Text(''),
              );
            } else {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                       children: [
                         Container(
                           height: height * 0.65,
                           width: width*0.90,
                           margin: EdgeInsets.all(height*0.02),
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(10),
                             image:DecorationImage(
                               image:AssetImage('assets/images/voice.jpg',),
                               fit: BoxFit.fill,
                             ),
                           ),
                         ),
                         Positioned(
                           top:20,
                           left: 1300,
                           right:10,
                           // bottom: 0,
                           child: IconButton(
                             icon: Icon(
                               Icons.language_sharp,
                               color: Colors.white,
                               size: 30,
                             ),
                             onPressed: () {
                               setState(() {
                                 LangWeb=!LangWeb;
                               });
                             },
                           ),
                         ),
                       ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: width*0.90,
                          height: height,
                          child: ListView.builder(
                              itemCount: VoicesOfChangeData.getVoiceOfChangeList.length,
                              itemBuilder: (Context,index) {
                                  return ChangeNotifierProvider.value(
                                      value: VoiceOfChange[index],
                                      child: VoicesOfChangeWidgetWeb(index: index));
                                },
                          ),
                          // child: Swiper(
                          //   itemWidth: width*0.95,
                          //   itemCount: VoicesOfChangeData.getVoiceOfChangeList.length,
                          //   itemBuilder: (Context,index) {
                          //     return ChangeNotifierProvider.value(
                          //         value: VoiceOfChange[index],
                          //         child: VoicesOfChangeWidgetWeb(index: index));
                          //   },
                          //   layout: SwiperLayout.STACK,
                          //   scale: 0.8,
                          //   index: 0,
                          // ),
                        ),
                        // Container(
                        //   height: height*0.50,
                        //   width: width*0.50,
                        //   color: Colors.red,
                        // ),
                      ],
                    ),
                  ],
                ),
              );
            }
          },
        ),

      ),
    )
        :ClimateVoicesMobile();

  }
}
