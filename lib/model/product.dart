import 'package:flutter/material.dart';

class Product with ChangeNotifier {
  String? productId;
  String? productName;
  String? productImage;
  int? productPrice;
  String? productDescription;
  String? productCategory;

  Product(
      {this.productId,
      this.productName,
      this.productImage,
      this.productPrice,
      this.productDescription,
      this.productCategory});
}
