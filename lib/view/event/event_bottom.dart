import 'package:flutter/material.dart';
import '../../model/event.dart';

class EventBottom extends StatelessWidget {

  final Event event;
  EventBottom(this.event);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height/1.5,
      padding: EdgeInsets.only(top: 20,left: 20,right: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40,),
          topRight: Radius.circular(40,),
        ),
      ),
      child: ListView(
        children: [
          Padding(padding: EdgeInsets.only(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(event.name,style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                  Text(event.category,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.grey),),
                  Row(
                    children: [
                      Text(event.num,style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.w400),),
                      SizedBox(width: 5,),
                      Icon(Icons.people,color: Colors.lightGreen,size: 26.0,),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Text(event.longDescription,style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.w400),),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(event.startdate),
                  Container(
                  width: 50,
                  height: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Icon(Icons.access_time_outlined),
                ),
                  Text(event.enddate),
                  Container(
                    width: 50,
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Icon(Icons.access_time_outlined),
                  ),

              ],),
              SizedBox(height: 20,),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 50,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Text(event.location,
                        style: TextStyle(fontSize: 16,color: Colors.white,),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                    Expanded(
                      child: InkWell(
                        onTap: (){},
                        child: Container(
                          height: 50,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.lightGreen,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Text(
                              'Join Event',
                              style: TextStyle(fontSize: 16,color: Colors.white,),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              ],
          ),
          ),
        ],
      ),
    );
  }
}
