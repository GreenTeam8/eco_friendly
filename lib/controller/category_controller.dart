//
// import 'dart:convert';
//
// import 'package:eco_friendly/model/category.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
//
// import '../model/product.dart';
//
// class CategoryController with ChangeNotifier{
//
//     List<Category> _categoriesList = [
//
//     Category(
//      categoryId: 'plants',
//      categoryName: "Plants",
//      categoryImage:  "plants.jpg"
//     ),
//     Category(
//         categoryId: 'appliances',
//         categoryName: "Appliances",
//         categoryImage:  "energy-efficient-appliances.jpg"
//     ),
//     Category(
//         categoryId: 'plasticBan',
//         categoryName: "Plastic Ban",
//         categoryImage:  "plastic-ban.jpg"
//     ),
//     Category(
//         categoryId: 'electronics',
//         categoryName: "Electronics",
//         categoryImage:  "electronics.png"
//     ),
//
//     // Product(
//     //     "Plants",
//     //     "plants.jpg",
//     //     "\$10",
//     //     "10kg",
//     //     Colors.green,
//     //     "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's ",
//     //     "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum"),
//     // Product(
//     //     "Appliances",
//     //     "energy-efficient-appliances.jpg",
//     //     "\$10",
//     //     "5kg",
//     //     Colors.amber,
//     //     "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's ",
//     //     "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum"),
//     // Product(
//     //     "Plastic Ban",
//     //     "plastic-ban.jpg",
//     //     "\$10",
//     //     "7kg",
//     //     Colors.red,
//     //     "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's ",
//     //     "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum"),
//     // Product(
//     //     "Electronics",
//     //     "electronics.png",
//     //     "\$10",
//     //     "7kg",
//     //     Colors.lightBlueAccent,
//     //     "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's ",
//     //     "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum"
//     // ),
//   ];
//
//     List<Category> get categoriesList => [..._categoriesList];
//
//   // Future<void> fetchCategories() async{
//   //   const url = 'https://climate-change-ec951-default-rtdb.firebaseio.com/categories.json';
//   //   try{
//   //     final response = await http.get(Uri.parse(url));
//   //     print(json.decode(response.body));
//   //     final extractedData = json.decode(response.body) as Map<String, dynamic>;
//   //     final List<Category> loadedCategories = [];
//   //     extractedData.forEach((categoryId, categoryData) {
//   //       loadedCategories.add(Category(
//   //           categoryId: categoryId,
//   //           categoryName: categoryData['categoryName'],
//   //           categoryImage: categoryData['categoryImage']
//   //       ));
//   //     });
//   //         _categoriesList = loadedCategories;
//   //     notifyListeners();
//   //   }catch(error){
//   //     throw (error);
//   //   }
//   // }
//
//
// }














///
///
import 'dart:convert';
import 'package:eco_friendly/helpers/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/category.dart';

class CategoryController with ChangeNotifier{

  List<Color> categoryColor = [
    mColor.withOpacity(0.8),
    mColor.withOpacity(0.8),
    mColor.withOpacity(0.8),
    mColor.withOpacity(0.8),
  ];
  List<Category> _categoriesList = [];

  /// getter for categoriesList to access the list from widgets and screen ENCAPSULATION Approach
  List<Category> get getCategoriesList {
    return [..._categoriesList];
  }

  ///method to fetch the categoryId and categoryName, categoryImage in the HomeScreen
  Future<void> fetchCategories () async{
    try{
      final  url = 'https://climate-change-ec951-default-rtdb.firebaseio.com/categories.json';
      final response = await http.get(Uri.parse(url));
      print(json.decode(response.body));
      print('***********************');
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      final List<Category> loadedCategories = [];
      extractedData.forEach((categoryId, categoryData) {
        print('product id ''${categoryId}');
        print('product dataName ''${categoryData['categoryName']}');
        print('product dataImage ''${categoryData['categoryImage']}');
        loadedCategories.add(
          Category(
            categoryId: categoryId,
            categoryName: categoryData['categoryName'],
            categoryImage: categoryData['categoryImage'],
            // products:

          ),
        );
      });
      _categoriesList = loadedCategories;
      notifyListeners();
    }catch(error){
      print(error);
      throw (error);
    }
  }
}