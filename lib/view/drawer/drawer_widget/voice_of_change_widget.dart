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
          height: height*0.35,
          margin: EdgeInsets.all(height * 0.01),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight:Radius.circular(10),
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
              image: DecorationImage(
                  image:NetworkImage(
                    climateChange.getVoiceOfChangeList[widget.index].VoiceImage!,
                  ),
                  fit: BoxFit.cover,
              ),
          ),
          child:  Container(
            color: Colors.green[100],
            padding: EdgeInsets.all(10),
            child: Text(
              climateChange.getVoiceOfChangeList[widget.index].VoiceName!,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(
                color: Colors.black87,
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
          height: height*0.50,
          padding: EdgeInsets.all(10),
          child: Text(
            climateChange.getVoiceOfChangeList[widget.index].VoiceDescription!,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(
              color: Colors.black87,

            ),
          ),
        ),
      ],
    );
  }
}