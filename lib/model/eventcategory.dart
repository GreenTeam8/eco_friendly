import 'package:flutter/cupertino.dart';

class eventCategory with ChangeNotifier {
  String? eCategoryId;
  String? eCategoryName;
  String? eCategoryImage;

  eventCategory({
    this.eCategoryId,
    this.eCategoryName,
    this.eCategoryImage,

  });
}