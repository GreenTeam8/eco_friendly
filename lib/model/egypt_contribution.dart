import 'package:flutter/material.dart';

class EgyptContribution with ChangeNotifier{
  String? Id;
  String? image;
  String? title;
  String? titleAr;
  String? Description;
  String? DescriptionAr;
  String? EgyItemCategory;

  EgyptContribution({
    this.Id,
    this.image,
    this.title,
    this.titleAr,
    this.Description,
    this.DescriptionAr,
    this.EgyItemCategory,
  });
}