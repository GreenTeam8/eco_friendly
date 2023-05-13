import 'package:flutter/material.dart';

class TaclingClimate with ChangeNotifier{
  String? Id;
  String? image;
  String? image2;
  String? image3;
  String? image4;
  String? title;
  String? title2;
  String? title3;
  String? titleAr;
  String? description;
  String? description3;
  String? description4;
  String? TaclingItemCategory;

  TaclingClimate({
    this.Id,
    this.image,
    this.image2,
    this.image3,
    this.image4,
    this.title,
    this.title2,
    this.title3,
    this.titleAr,
    this.description,
    this.description3,
    this.description4,
    this.TaclingItemCategory,
  });
}