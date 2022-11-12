import 'package:get/get.dart';

class BottomNavigationBarController extends GetxController{

  int _selectedIndex = 0;

  get getSelectedIndex => _selectedIndex;

  set setSelectedIndex(value) {
    _selectedIndex = value;
  }
}