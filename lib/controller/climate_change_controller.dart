import 'dart:convert';
import 'package:eco_friendly/model/climate_carosel_slider.dart';
import 'package:eco_friendly/model/climate_chamge.dart';
import 'package:eco_friendly/model/tacling_climate.dart';
import 'package:eco_friendly/model/voices%20_of_change.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class ClimateChangeController with ChangeNotifier{
  List<ClimateChange> _climateChangeList = [];
  List<ClimateCaroselSlider> _climateCarosel = [];
  List<VoicesOfChange> _voiceOfChangeList = [];
  List<TaclingClimate> _tacklingClimateList = [];

  /// getter for Lists to access the list from widgets and screen ENCAPSULATION Approach

  List<ClimateChange> get getClimateChangeList {
    return [..._climateChangeList];
  }
  List<ClimateCaroselSlider> get getClimateCaroselList {
    return [..._climateCarosel];
  }
  List<VoicesOfChange> get getVoiceOfChangeList {
    return [..._voiceOfChangeList];
  }
  List<TaclingClimate> get getTacklingClimateList {
    return [..._tacklingClimateList];
  }


  List<ClimateChange> findAllItemsById(String ItemCategoryId) {
    return getClimateChangeList
        .where((element) => element.ItemCategory == ItemCategoryId)
        .toList();
  }
  ClimateChange findItemsById(String ItemId) {
    return getClimateChangeList
        .firstWhere((element) => element.Id == ItemId);
  }


  ///methods For fetch
  Future<void> fetchClimateChange () async{
    try{
      final  url = 'https://climate-change-ec951-default-rtdb.firebaseio.com/climateChange.json';
      final response = await http.get(Uri.parse(url));
      print(json.decode(response.body));
      print('***********************');
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      final List<ClimateChange> loadClimateChange = [];
      extractedData.forEach((Id, climateChangeData) {
        loadClimateChange.add(
          ClimateChange(
            Id: Id,
            name: climateChangeData['name'],
            nameAr: climateChangeData['nameAr'],
            image: climateChangeData['image'],
            ItemDescription: climateChangeData['ItemDescription'],
            ItemDescriptionAr: climateChangeData['ItemDescriptionAr'],
            ItemTitle: climateChangeData['ItemTitle'],
            ItemTitleAr: climateChangeData['ItemTitleAr'],
            Atitle: climateChangeData['Atitle'],
            AtitleAr: climateChangeData['AtitleAr'],
            Adescription: climateChangeData['Adescription'],
            AdescriptionAr: climateChangeData['AdescriptionAr'],
            Aimage: climateChangeData['Aimage'],
            Btitle: climateChangeData['Btitle'],
            BtitleAr: climateChangeData['BtitleAr'],
            Bdescription: climateChangeData['Bdescription'],
            BdescriptionAr: climateChangeData['BdescriptionAr'],
            Bimage: climateChangeData['Bimage'],
            Ctitle: climateChangeData['Ctitle'],
            CtitleAr: climateChangeData['CtitleAr'],
            Cdescription: climateChangeData['Cdescription'],
            CdescriptionAr: climateChangeData['CdescriptionAr'],
            Cimage: climateChangeData['Cimage'],
            Dtitle: climateChangeData['Dtitle'],
            DtitleAr: climateChangeData['DtitleAr'],
            Ddescription: climateChangeData['Ddescription'],
            DdescriptionAr: climateChangeData['DdescriptionAr'],
            Dimage: climateChangeData['Dimage'],

          ),
        );
      });
      _climateChangeList = loadClimateChange;
      notifyListeners();
    }catch(error){
      print(error);
      throw (error);
    }
  }
  Future<void> fetchcaroselSlider () async{
    try{
      final  url = 'https://climate-change-ec951-default-rtdb.firebaseio.com/caroselSlider.json';
      final response = await http.get(Uri.parse(url));
      print(json.decode(response.body));
      print('***********************');
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      final List<ClimateCaroselSlider> loadClimateCaroselSlider = [];
      extractedData.forEach((id, ClimateCaroselSliderData) {
        print('id ''${id}');
        print(' dataImage ''${ClimateCaroselSliderData['image']}');
        print(' Item dataDescription''${ClimateCaroselSliderData['description']}');
        loadClimateCaroselSlider.add(
          ClimateCaroselSlider(
            id: id,
            image: ClimateCaroselSliderData['image'],
            description: ClimateCaroselSliderData['description'],


          ),
        );
      });
      _climateCarosel = loadClimateCaroselSlider;
      notifyListeners();
    }catch(error){
      print(error);
      throw (error);
    }
  }
  Future<void> fetchVoiceOfChange () async{
    try{
      final  url = 'https://climate-change-ec951-default-rtdb.firebaseio.com/voicesOfChange.json';
      final response = await http.get(Uri.parse(url));
      print(json.decode(response.body));
      print('***********************');
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      final List<VoicesOfChange> loadVoicesOfChange = [];
      extractedData.forEach((id, VoicesOfChangeData) {
        loadVoicesOfChange.add(
          VoicesOfChange(
            VoiceName: VoicesOfChangeData['VoiceName'],
            VoiceNameAr: VoicesOfChangeData['VoiceNameAr'],
            VoiceImage: VoicesOfChangeData['VoiceImage'],
            VoiceDescription: VoicesOfChangeData['VoiceDescription'],
            VoiceDescriptionAr: VoicesOfChangeData['VoiceDescriptionAr'],
          ),
        );
      });
      _voiceOfChangeList = loadVoicesOfChange;
      notifyListeners();
    }catch(error){
      print(error);
      throw (error);
    }
  }
  Future<void> fetchTaclingClimate () async{
    try{
      final  url = 'https://climate-change-ec951-default-rtdb.firebaseio.com/tacklingClimate.json';
      final response = await http.get(Uri.parse(url));
      print(json.decode(response.body));
      print('***********************');
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      final List<TaclingClimate> loadTaclingClimate = [];
      extractedData.forEach((id, TaclingClimateData) {
        loadTaclingClimate.add(
          TaclingClimate(
            title: TaclingClimateData['title'],
            titleAr: TaclingClimateData['titleAr'],
            image: TaclingClimateData['image'],
            description: TaclingClimateData['description'],
          ),
        );
      });
      _tacklingClimateList = loadTaclingClimate;
      notifyListeners();
    }catch(error){
      print(error);
      throw (error);
    }
  }
}