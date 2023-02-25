import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:eco_friendly/model/eventcategory.dart';

class ECategoryController with ChangeNotifier{

  List<eventCategory> _eventCategoriesList = [];

  /// getter for event categories List to access the list from widgets and screen ENCAPSULATION Approach
  List<eventCategory> get getECategoriesList {
    return [..._eventCategoriesList];
  }

  ///method to fetch the eCategoryId and eCategoryName, eCategoryImage in the HomeScreen
  Future<void> fetchEventCategories () async{
    try{
      final  url = 'https://climate-change-ec951-default-rtdb.firebaseio.com/eventcategory.json';
      final response = await http.get(Uri.parse(url));
      print(json.decode(response.body));
      print('***********************');
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      final List<eventCategory> loadedCategories = [];
      extractedData.forEach((eCategoryId, ecategoryData) {
        print('eCategory id ''${eCategoryId}');
        print('eCategoryName dataName ''${ecategoryData['eCategoryName']}');
        print('eCategoryImage dataImage ''${ecategoryData['eCategoryImage']}');
        loadedCategories.add(
          eventCategory(
            eCategoryId: eCategoryId,
            eCategoryName: ecategoryData['eCategoryName'],
            eCategoryImage: ecategoryData['eCategoryImage'],
          ),
        );
      });
      _eventCategoriesList = loadedCategories;
      notifyListeners();
    }catch(error){
      print(error);
      throw (error);
    }
  }
}