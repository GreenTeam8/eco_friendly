import 'package:flutter/cupertino.dart';

class Category with ChangeNotifier {
  String? categoryId;
  String? categoryName;
  String? categoryImage;

  Category({
    this.categoryId,
    this.categoryName,
    this.categoryImage,
  });
}
