import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget web;
  final Widget? tablet;
  final Widget? mobileLarge;
  final Widget mobile;

   Responsive({Key? key, required this.web,  this.tablet,  this.mobileLarge, required this.mobile}) : super(key: key);

static bool isWeb(BuildContext context){
  return MediaQuery.of(context).size.width >= 1200;
}
  static bool isTablet(BuildContext context){
    return MediaQuery.of(context).size.width < 1024;
  }
  static bool isMobileLarge(BuildContext context){
    return MediaQuery.of(context).size.width >= 720;
  }
  static bool isMobile(BuildContext context){
    return MediaQuery.of(context).size.width >= 500;
  }

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;

    if(_size.width >= 1024){
      return web;
    }else if(_size.width >= 700 && tablet != null){
      return tablet!;
    }else if (_size.width >= 450 && mobileLarge != null){
      return mobileLarge!;
    }else{
      return mobile;
    }
  }
}
