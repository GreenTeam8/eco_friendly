import 'package:eco_friendly/controller/climate_change_controller.dart';
import 'package:eco_friendly/helpers/size_config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VoicesOfChangeWidget extends StatefulWidget {
  int index;
  VoicesOfChangeWidget({ required this.index,Key? key}) : super(key: key);

  @override
  State<VoicesOfChangeWidget> createState() => _VoicesOfChangeWidgetState();
}
 bool lan =true;
class _VoicesOfChangeWidgetState extends State<VoicesOfChangeWidget> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.screenWidth!;
    double height = SizeConfig.screenHeight!;
    final climateChange = Provider.of<ClimateChangeController>(context, listen: false);
    return Column(
      children: [
        Container(
          alignment: Alignment.bottomLeft,
          width: width,
          height: height*0.36,
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
          child:  Container(
            color: Colors.green[100],
            padding: EdgeInsets.all(10),
            child: Text(
             lan?climateChange.getVoiceOfChangeList[widget.index].VoiceName!:climateChange.getVoiceOfChangeList[widget.index].VoiceNameAr!,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(
                color: Colors.grey[800],
                fontWeight: FontWeight.bold
              ),
            ),
          ),
        ),
        SizedBox(
          height: height*0.05,
        ),
        Container(
          color: Colors.green[100],
          height: height*0.40,
          padding: EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Text(
              lan?climateChange.getVoiceOfChangeList[widget.index].VoiceDescription!:climateChange.getVoiceOfChangeList[widget.index].VoiceDescriptionAr!,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(
                color: Colors.grey[800],
              ),
              textAlign: TextAlign.justify,
            ),
          ),
        ),
      ],
    );
  }
}
