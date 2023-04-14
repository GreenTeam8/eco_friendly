import 'dart:convert';
import 'package:eco_friendly/model/product.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductController with ChangeNotifier {
  List<Product> _productsList = [];
  List<Product> _favsList = [];
  final String? authToken;
  final String? userId;

  ProductController({this.authToken, this.userId, });
  //ProductController({this.authToken, this.userId, this._productsList});


  /// getter for productsList to access the list from widgets and screen ENCAPSULATION Approach
  List<Product> get getProductsList {
    return [..._productsList];
  }


  List<Product> get getFavsList {
   return [..._favsList];
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

  List<Product> get favoriteItems{
    return _favsList.where((product) => product.isFavorite).toList();
  }

  ///problem with fetching favorites!!!!
  Future<void> fetchFavorites() async{
    var url = 'https://climate-change-ec951-default-rtdb.firebaseio.com/userFavorites/$userId.json?auth=$authToken';
    final favoriteResponse = await http.get(Uri.parse(url));
     var favoriteData = json.decode(favoriteResponse.body)  as Map<String, dynamic>;
    final List<Product> favLoadedProducts = [];
    favoriteData.forEach((productId, productData) {
      favLoadedProducts.add(Product(
        productId: productId,
        productName: productData['productName'],
        productDescription: productData['productDescription'],
        productPrice: productData['productPrice'],
        productImage: productData['productImage'],
        isFavorite: favoriteData == '' ? false : favoriteData['isFavorite'] ?? false,
      ));
    });
    _favsList = favLoadedProducts;
    notifyListeners();
  }

  Future<void> deleteFavProduct(String id, String productId) async{
    final url = 'https://climate-change-ec951-default-rtdb.firebaseio.com/userFavorites/$id/$productId.json?auth=$authToken';
    // final existingProductIndex = _favsList.indexWhere((element) => element.productId == id);
    // Product? existingProduct = _favsList[existingProductIndex];
    // _favsList.removeAt(existingProductIndex);
    notifyListeners();
    final response = await http.delete(Uri.parse(url));
    // if(response.statusCode >= 400){
    //   _favsList.insert(existingProductIndex, existingProduct);
    //   notifyListeners();
    //   throw HttpException('Could not delete the product');
    // }
    // existingProduct = null;
    // _items.removeWhere((element) => element.productId == id);
  print(response.body);

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
        print('product dataDescription ' '${productData['productDescription']}');
        print('product dataCategory ' '${productData['productCategory']}');

        // final favUrl = 'https://climate-change-ec951-default-rtdb.firebaseio.com/userFavorites/$userId.json?auth=$authToken';
        // final favoriteResponse = await http.get(Uri.parse(favUrl));
        // final favoriteData = json.decode(favoriteResponse.body) ;
        loadedProducts.add(
          Product(
            productId: productId,
            productName: productData['productName'],
            productImage: productData['productImage'],
            productPrice: productData['productPrice'],
            productDescription: productData['productDescription'],
            productCategory: productData['productCategory'],
           // isFavorite: favoriteData == null ? false : favoriteData[productId] ?? false,
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
