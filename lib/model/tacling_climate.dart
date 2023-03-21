import 'package:flutter/material.dart';

class TaclingClimate with ChangeNotifier{
  String? image;
  String? title;
  String? description;

  TaclingClimate({
    this.image,
    this.title,
    this.description,
  });
}