import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;



class Product with ChangeNotifier {
  String? productId;
  String? productName;
  String? productImage;
  int? productPrice;
  String? productDescription;
  String? productCategory;
  bool isFavorite;

  Product(
      {this.productId,
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
