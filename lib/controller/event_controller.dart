import 'dart:convert';
import 'package:eco_friendly/model/event.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EventController with ChangeNotifier {
  List<Event> _eventsList = [];

  /*
  final String authToken;
  final String userId;

  EventController(this.authToken, this.userId);
*/

  Map <String, Event> _items = {};


  /// to get the map (_items) and manipulate it

  /// getter for eventsList to access the list from widgets and screen ENCAPSULATION Approach
  List<Event> get getEventsList {
    return [..._eventsList];
  }


  List<Event> findAllEventsById(String eCategoryId) {
    return getEventsList
        .where((element) => element.eventCategory == eCategoryId)
        .toList();
  }

  Event findEventsById(String eventId) {
    return getEventsList
        .firstWhere((element) => element.eventId == eventId);
  }


  /// FETCHING events from firebase using GET method then mapping it to our event Model
  Future<void> fetchEvents() async {
    try {
      final url =
          'https://climate-change-ec951-default-rtdb.firebaseio.com/events.json';
      final response = await http.get(Uri.parse(url));
      //print(json.decode(response.body));
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      final List<Event> loadedEvents = [];
      extractedData.forEach((eventId, eventData) {
        ///printing for testing
        print('event id ' '${eventId}');
        print('event dataName ' '${eventData['eventName']}');
        print('event dataImage ' '${eventData['eventImage']}');
        print('event dataPrice ' '${eventData['eventNumber']}');
        print('event dataDescription ' '${eventData['eventDescription']}');
        print('event dataCategory ' '${eventData['eventCategory']}');

        // final joinUrl = 'https://climate-change-ec951-default-rtdb.firebaseio.com/joinneduser/$userId.json?auth=$authToken';
        // final joinResponse = await http.get(Uri.parse(joinUrl));
        // final joinData = json.decode(joinResponse.body) ;
        loadedEvents.add(
          Event(
            eventId: eventId,
            eventName: eventData['eventName'],
            eventImage: eventData['eventImage'],
            eventNumber: eventData['eventNumber'],
            eventDescription: eventData['eventDescription'],
            eventCategory: eventData['eventCategory'],
            firstdateTime:eventData['firstdateTime'],
            eventCountry:eventData['eventCountry'],
          ),
        );
      });
      _eventsList = loadedEvents;
      notifyListeners();
    } catch (error) {
      print(error);
      throw (error);
    }
  }

}
/*
  void toggleJoin(String eventId, bool isJoinned , int eventNumber){
    if(isJoinned = false){
      isJoinned = true;
      eventNumber +1;
    }
    else{
      isJoinned = false;
      eventNumber -1;
    }
    notifyListeners();
  }
*/