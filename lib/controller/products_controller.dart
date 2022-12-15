import 'dart:convert';
import 'package:eco_friendly/model/product.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductController with ChangeNotifier {
  List<Product> _productsList = [];

  /// getter for productsList to access the list from widgets and screen ENCAPSULATION Approach
  List<Product> get getProductsList {
    return [..._productsList];
  }

  List<Product> findAllProductsById(String productCategoryId) {
    return getProductsList
        .where((element) => element.productCategory == productCategoryId)
        .toList();
  }

  Product findProductById(String productId) {
    return getProductsList
        .firstWhere((element) => element.productId == productId);
  }

  /// FETCHING products from firebase using GET method then mapping it to our Product Model
  Future<void> fetchProducts() async {
    try {
      final url =
          'https://climate-change-ec951-default-rtdb.firebaseio.com/products.json';
      final response = await http.get(Uri.parse(url));
      //print(json.decode(response.body));
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      final List<Product> loadedProducts = [];
      extractedData.forEach((productId, productData) {
        ///printing for testing
        print('product id ' '${productId}');
        print('product dataName ' '${productData['productName']}');
        print('product dataImage ' '${productData['productImage']}');
        print('product dataPrice ' '${productData['productPrice']}');
        print(
            'product dataDescription ' '${productData['productDescription']}');
        print('product dataCategory ' '${productData['productCategory']}');
        loadedProducts.add(
          Product(
            productId: productId,
            productName: productData['productName'],
            productImage: productData['productImage'],
            productPrice: productData['productPrice'],
            productDescription: productData['productDescription'],
            productCategory: productData['productCategory'],
          ),
        );
      });
      _productsList = loadedProducts;
      notifyListeners();
    } catch (error) {
      print(error);
      throw (error);
    }
  }
}
