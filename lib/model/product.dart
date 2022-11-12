import 'package:flutter/material.dart';

class Product {
  String name;
  String image;
  String price;
  String kg;
  Color? color;
  String description;
  String longDescription;

  Product(this.name, this.image, this.price, this.kg, this.color,
      this.description, this.longDescription);
}