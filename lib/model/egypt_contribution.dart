import 'package:flutter/material.dart';

class EgyptContribution with ChangeNotifier{
  String? Id;
  String? image;
  String? Aimage;
  String? title;
  String? titleAr;
  String? Description;
  String? EgyItemCategory;

  EgyptContribution({
    this.Id,
    this.image,
    this.Aimage,
    this.title,
    this.titleAr,
    this.Description,
    this.EgyItemCategory,
  });
}