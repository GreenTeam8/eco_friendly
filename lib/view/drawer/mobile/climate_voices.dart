import 'package:card_swiper/card_swiper.dart';
import 'package:eco_friendly/controller/climate_change_controller.dart';
import 'package:eco_friendly/helpers/constants.dart';
import 'package:eco_friendly/helpers/size_config.dart';
import 'package:eco_friendly/view/drawer/drawer_widget/voice_of_change_widget.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class  ClimateVoicesMobile extends StatefulWidget {
  const ClimateVoicesMobile({Key? key}) : super(key: key);

  @override
  State<ClimateVoicesMobile> createState() => _ClimateVoicesMobileState();
}

class _ClimateVoicesMobileState extends State<ClimateVoicesMobile> {
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
            lan?"Speak up now! ":"! تكلم الآن",
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
              color: mainColor,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.language),
            color: mainColor,
            onPressed: () {
              setState(() {
                lan=!lan;
              });
            },
          ),
        ],
      ),
      body:SafeArea(
        child:FutureBuilder(
            future: _climateVoices,
            builder: (context, snapshot) {
              if(snapshot.connectionState == ConnectionState.waiting){
                return Center(child: Lottie.asset('assets/lottie/loading.json', height: height * 0.2),);
              }else{
                return ListView(
                  children: [
                    Container(
                      width: width,
                      height: height ,
                      child: Swiper(
                        itemWidth: width*0.90,
                        itemCount: VoicesOfChangeData.getVoiceOfChangeList.length,
                        itemBuilder: (Context,index) {
                          return ChangeNotifierProvider.value(
                              value: VoiceOfChange[index],
                              child: VoicesOfChangeWidget(index: index));
                        },
                        layout: SwiperLayout.STACK,
                        scale: 0.8,
                        index: 0,
                      ),
                    ),
                  ],
                );
              }
            }),
      ),
    );
  }
}
