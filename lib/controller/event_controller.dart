import 'dart:convert';
import 'package:eco_friendly/helpers/http_exception.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:eco_friendly/model/event.dart';

// Define the EventController class and make it a ChangeNotifier
class EventController with ChangeNotifier {

  // List of events
  List<Event> _eventsList = [];

// Getter for the list of events
  List<Event> get getEventsList {
    return [..._eventsList];
  }

// Find all events with the given event category ID
  List<Event> findAllEventsById(String eCategoryId) {
    return getEventsList
        .where((element) => element.eventCategory == eCategoryId)
        .toList();
  }

// Find the event with the given event ID
  Event findEventsById(String eventId) {
    return getEventsList
        .firstWhere((element) => element.eventId == eventId);
  }

// Fetch the list of events from the Firebase Realtime Database
  Future<void> fetchEvents() async {
    try {
      final url = 'https://climate-change-ec951-default-rtdb.firebaseio.com/events.json';
      final response = await http.get(Uri.parse(url));
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      final List<Event> loadedEvents = [];
      for (final eventId in extractedData.keys) {
        final eventData = extractedData[eventId] as Map<String, dynamic>;
        final participantsUrl = 'https://climate-change-ec951-default-rtdb.firebaseio.com/events/$eventId/participants.json';
        final participantsResponse = await http.get(Uri.parse(participantsUrl));
        final participantsData = json.decode(participantsResponse.body) as List<dynamic>?;
        final participants = participantsData?.map((userId) => userId.toString()).toSet() ?? {};
        loadedEvents.add(
          Event(
            eventId: eventId,
            eventName: eventData['eventName'],
            eventImage: eventData['eventImage'],
            eventCategory: eventData['eventCategory'],
            eventDescription: eventData['eventDescription'],
            firstdateTime:eventData['firstdateTime'],
            eventCountry:eventData['eventCountry'],
            participants: participants,
          ),
        );
      }
      _eventsList = loadedEvents;
      notifyListeners();
    } catch (error) {
      print(error);
      throw (error);
    }
  }

// Add a participant with the given userId to the given event
  Future<void> addParticipant(Event event, String userId) async {
    try {
      await event.addParticipant(userId);
      notifyListeners();
    } catch (error) {
      print(error);
      throw (error);
    }
  }

// Remove a participant with the given userId from the given event
  Future<void> removeParticipantFromEvent(Event event, String userId) async {
    try {
      await event.removeParticipant(userId);
      notifyListeners();
    } catch (error) {
      print(error);
      throw (error);
    }
  }

}