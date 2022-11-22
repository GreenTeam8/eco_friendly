import 'package:flutter/widgets.dart';

class SizeConfig{
  static MediaQueryData? _mediaQueryData;
  static double? screenWidth;
  static double? screenHeight;
  static double? defaultSize;
  static Orientation? orientation;

  void init(BuildContext context){
  _mediaQueryData = MediaQuery.of(context);
  screenWidth = _mediaQueryData!.size.width;
  print('width ''$screenWidth');
  screenHeight = _mediaQueryData!.size.height;
  print('height ''$screenHeight');
  orientation = _mediaQueryData!.orientation;

  defaultSize = orientation == Orientation.landscape ? screenHeight! * 0.024 : screenWidth! * 0.024;
  //print('default size ''$defaultSize');
  }


}