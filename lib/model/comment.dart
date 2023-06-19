import 'package:eco_friendly/helpers/http_exception.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Comment with ChangeNotifier {
  final String id;
  final String text;
  final String userId;
  final DateTime timestamp;

  Comment({
    required this.id,
    required this.text,
    required this.userId,
    required this.timestamp,
  });


}