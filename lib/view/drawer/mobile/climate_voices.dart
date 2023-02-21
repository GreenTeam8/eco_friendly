import 'package:card_swiper/card_swiper.dart';
import 'package:eco_friendly/controller/climate_change_controller.dart';
import 'package:eco_friendly/helpers/constants.dart';
import 'package:eco_friendly/helpers/size_config.dart';
import 'package:eco_friendly/view/drawer/drawer_widget/voice_of_change_widget.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class  ClimateVoices extends StatefulWidget {
  const ClimateVoices({Key? key}) : super(key: key);

  @override
  State<ClimateVoices> createState() => _ClimateVoicesState();
}

class _ClimateVoicesState extends State<ClimateVoices> {
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
              "Speak up and act now! ",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Colors.white,
              ),
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.join_right_outlined),
              color: Colors.white,
              onPressed: () {},
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
      ),
    );
  }
}
