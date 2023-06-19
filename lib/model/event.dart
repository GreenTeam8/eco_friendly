import 'package:eco_friendly/helpers/http_exception.dart';

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class User {
  final String id;
  final double rating;

  User({required this.id, required this.rating});
}
// Define the Event class and make it a ChangeNotifier
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
  final Set<String> participants;
  int participantCount;
  double eventRating;


  /*  */


// Define the Event class and make it a ChangeNotifier
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
        this.eventRating = 0.0,
        required this.participants,
      }) : participantCount = participants.length; // Initialize participantCount to the length of participants


// Check if a user with the given userId is a participant of the event
  bool isParticipant(String userId) {
    return participants?.contains(userId) ?? false;
  }

// Add a participant with the given userId to the participants set
  Future<void> addParticipant(String userId) async {
    try {
      participants.add(userId);
      participantCount = participants.length;
      final url = 'https://climate-change-ec951-default-rtdb.firebaseio.com/events/$eventId/participants.json';
      final response = await http.put(
        Uri.parse(url),
        body: json.encode(participants.toList()),
      );
      if (response.statusCode >= 400) {
        throw HttpException('Failed to add participant.');
      }
    } catch (error) {
      print(error);
      throw (error);
    }
  }

// Remove a participant with the given userId from the participants set
  Future<void> removeParticipant(String userId) async {
    try {
      participants.remove(userId);
      participantCount = participants.length;
      final url = 'https://climate-change-ec951-default-rtdb.firebaseio.com/events/$eventId/participants.json';
      final response = await http.put(
        Uri.parse(url),
        body: json.encode(participants.toList()),
      );
      if (response.statusCode >= 400) {
        throw HttpException('Failed to remove participant.');
      }
    } catch (error) {
      print(error);
      throw (error);
    }
  }

}

