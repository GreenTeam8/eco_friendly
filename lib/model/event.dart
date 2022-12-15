import 'package:flutter/material.dart';

class Event {
  String name;
  String location;
  String date;
  String startdate;
  String enddate;
  String image;
  String num;
  String longDescription;
  String category;


  Event(this.name,this.location,this.date,this.startdate,this.enddate, this.image,this.num, this.longDescription,this.category,);

  get color =>  Colors.grey;
}

class category {
  String name;
  category(this.name,);

}