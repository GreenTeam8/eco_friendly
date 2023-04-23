import 'package:eco_friendly/controller/climate_change_controller.dart';
import 'package:eco_friendly/helpers/constants.dart';
import 'package:eco_friendly/helpers/size_config.dart';
import 'package:eco_friendly/view/drawer/web/climate_voice_web.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VoicesOfChangeWidgetWeb extends StatefulWidget {
  int index;
  VoicesOfChangeWidgetWeb({ required this.index,Key? key}) : super(key: key);

  @override
  State<VoicesOfChangeWidgetWeb> createState() => _VoicesOfChangeWidgetWebState();
}
bool lan =true;
class _VoicesOfChangeWidgetWebState extends State<VoicesOfChangeWidgetWeb> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.screenWidth!;
    double height = SizeConfig.screenHeight!;
    final climateChange = Provider.of<ClimateChangeController>(context, listen: false);
    return Row(
      children: [
        Container(
          alignment: Alignment.bottomLeft,
          width: width*0.40,
          height: height*0.50,
          margin: EdgeInsets.all(height * 0.01),
          decoration: BoxDecoration(
            borderRadius:BorderRadius.circular(20),
            image: DecorationImage(
              image:NetworkImage(
                climateChange.getVoiceOfChangeList[widget.index].VoiceImage!,
              ),
              fit: BoxFit.fill,
            ),
          ),
          // child:  Container(
          //   color: Colors.green[100],
          //   padding: EdgeInsets.all(10),
          //   child: Text(
          //     lan?climateChange.getVoiceOfChangeList[widget.index].VoiceName!:climateChange.getVoiceOfChangeList[widget.index].VoiceNameAr!,
          //     style: Theme.of(context)
          //         .textTheme
          //         .bodyMedium!
          //         .copyWith(
          //         color: Colors.grey[800],
          //         fontWeight: FontWeight.bold
          //     ),
          //   ),
          // ),
        ),
        SizedBox(width: width*0.02,),
        Container(
          width:width* 0.45,
          height: height*0.50,
          decoration: BoxDecoration(
              border: Border.all(
                color: mainColor,
              ),
              borderRadius: BorderRadius.circular(10)),
          // color: Colors.green[100],
          padding: EdgeInsets.all(10),
          child: ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    LangWeb?climateChange.getVoiceOfChangeList[widget.index].VoiceName!:climateChange.getVoiceOfChangeList[widget.index].VoiceNameAr!,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(
                        color: mainColor,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(
                    height: height*0.02,
                  ),
                  Text(
                    LangWeb?climateChange.getVoiceOfChangeList[widget.index].VoiceDescription!:climateChange.getVoiceOfChangeList[widget.index].VoiceDescriptionAr!,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(
                      color: Colors.grey[800],
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
