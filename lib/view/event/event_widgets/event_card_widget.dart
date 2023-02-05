
import 'package:eco_friendly/view/event/event_details.dart';
import 'package:flutter/material.dart';
import 'package:eco_friendly/model/event.dart';

import '../../../controller/dummy_event_list.dart';
import '../../../helpers/constants.dart';
import '../../../helpers/size_config.dart';


class EventCard extends StatelessWidget {

   EventCard({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double height = SizeConfig.screenHeight! ;
    double width = SizeConfig.screenWidth! ;
    return Container(
      height: height * 0.5,
      margin: EdgeInsets.only(top: kMargin/2),
      child: ListView.builder(
        itemCount: EventItem.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
          Event event = EventItem[index];
            return Padding(
                padding:EdgeInsets.all(15),
                child: Column(
                  children: [
                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context)=>EventDetails(event),
                        ));
                      },
                      child: Container(
                        height: 200,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                            image: AssetImage('assets/images/''${EventItem[index].image}'),
                            fit: BoxFit.cover,
                            opacity: 0.8,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                        padding:EdgeInsets.only(top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(EventItem[index].name, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),),
                            Text(EventItem[index].date, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey),),

                          ],
                        ),
                    ),
                    SizedBox(height: 5,),
                    Row(
                      children: [
                        ElevatedButton(
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: kPadding)),
                            backgroundColor: MaterialStateProperty.all(Colors.green),
                            shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                            elevation: MaterialStateProperty.all(1)
                            ), child: Text('Join Event', style: TextStyle(color: Colors.white),),
                          onPressed: (){},
                          ),
                      ],
                    ),
                  ],
                ),
            );
          },),
    );
  }
}
