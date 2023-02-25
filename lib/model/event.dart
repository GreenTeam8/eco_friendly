import 'package:eco_friendly/model/cart_item.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Event with ChangeNotifier {
  String? eventId;
  String? eventName;
  String? eventImage;
  int? eventNumber;
  String? eventDescription;
  String? eventCategory;
  String? firstdateTime;
  String? lastdateTime;
  String? eventStreet;
  String? eventCity;
  String? eventCountry;
  bool isJoinned;


  /*  */



  Event(
      {this.eventId,
        this.eventName,
        this.eventImage,
        this.eventNumber,
        this.eventDescription,
        this.eventCategory,
        this.firstdateTime,
        this.lastdateTime,
        this.eventStreet,
        this.eventCity,
        this.eventCountry,
        this.isJoinned = false
      });

/*
  void _setJoinValue (bool newValue){
    isJoinned = newValue;
    notifyListeners();
  }

  Future <void> toggleJoinStatue(String token, String userId,) async{
    final oldStatus = isJoinned;
    isJoinned = !isJoinned;
    notifyListeners();

    final url = 'https://climate-change-ec951-default-rtdb.firebaseio.com/joinneduser/$userId/$eventId.json?auth=$token';
    try{
      final response = await http.put(Uri.parse(url), body: json.encode(
          {
            'isJoinned':isJoinned,
            'eventName':eventName,
            'eventImage':eventImage,
            'eventNumber':eventNumber,
            'eventDescription':eventDescription,
            'firstdateTime':firstdateTime,
            'lastdateTime':lastdateTime,
            'eventStreet':eventStreet,
            'eventCity':eventCity,
            'eventCountry':eventCountry
          }
      ));

      if(response.statusCode >= 400){
        _setJoinValue(oldStatus);
      }
    }catch(error){
      _setJoinValue(oldStatus);
      throw error;
    }

  }
*/
}