
import 'package:eco_friendly/view/event/event_details.dart';
import 'package:eco_friendly/view/event/event_page.dart';
import 'package:flutter/material.dart';
import 'package:eco_friendly/model/event.dart';

import '../../../helpers/constants.dart';
import '../../../helpers/size_config.dart';


class EventHomeCard extends StatelessWidget {

  EventHomeCard({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double height = SizeConfig.screenHeight! ;
    double width = SizeConfig.screenWidth! ;
    return InkWell(
      onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>EventPage()));},
      splashColor: pColor,
      focusColor: pColor,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.event_note,color: Colors.grey[700], size: 20,),
              Text('Events', style: Theme.of(context).textTheme.bodyText2!.copyWith(fontWeight: FontWeight.bold, fontSize: 20),),
            ],
          ),
          Container(
            alignment: Alignment.bottomLeft,
            width: width * 0.90,
            height: height * 0.30,
            //margin: EdgeInsets.all(height * 0.01),
            decoration: BoxDecoration(
                borderRadius:  BorderRadius.all(Radius.circular(18)),
                // color: controller.productsList[index].color,
                image: DecorationImage(
                    image: AssetImage('assets/images/eco_event_two.jpeg'),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.10),
                        BlendMode.multiply)),
                boxShadow: [
                  BoxShadow(
                    //color: productItem[index].color!.withOpacity(0.60),
                      color: Colors.black26.withOpacity(0.30),
                      offset: const Offset(-10, 10),
                      blurRadius: 10)
                ]),
            child: Padding(
              padding: EdgeInsets.all(width * 0.01),
              child: Text(
                'Events',
                style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
