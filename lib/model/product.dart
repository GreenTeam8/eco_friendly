import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../helpers/http_exception.dart';



class Product with ChangeNotifier {
  final String? productId;
  final String? productName;
  final String? productImage;
  final double? productPrice;
  final String? productDescription;
  final String? productCategory;
  bool isFavorite;

  Product(
      { this.productId,
       this.productName,
       this.productImage,
       this.productPrice,
       this.productDescription,
        this.productCategory,
      this.isFavorite = false
      });


  void _setFavValue (bool newValue){
    isFavorite = newValue;
    notifyListeners();
  }
  Future <void> toggleFavoriteStatue(String token, String userId,) async{
    final oldStatus = isFavorite;
    isFavorite = !isFavorite;
    notifyListeners();

    final url = 'https://climate-change-ec951-default-rtdb.firebaseio.com/userFavorites/$userId/$productId.json?auth=$token';
    try{
      final response = await http.put(Uri.parse(url), body: json.encode(
        {
          'isFavorite':isFavorite,
          'productName':productName,
          'productImage':productImage,
          'productPrice':productPrice,
          'productDescription':productDescription
        }
      ));

      if(response.statusCode >= 400){
        _setFavValue(oldStatus);
      }
    }catch(error){
      _setFavValue(oldStatus);
      throw error;

    }

  }




}
