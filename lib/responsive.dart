import 'dart:io';

import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget web;
  final Widget? tablet;
  final Widget? mobileLarge;
  final Widget mobile;

   const Responsive({Key? key, required this.web,  this.tablet,  this.mobileLarge, required this.mobile}) : super(key: key);

static bool isWeb(BuildContext context){
  return MediaQuery.of(context).size.width >= 700;
}
  static bool isTablet(BuildContext context){
    return MediaQuery.of(context).size.width < 900;
  }
  static bool isMobileLarge(BuildContext context){
    return MediaQuery.of(context).size.width >= 720;
  }
  static bool isMobile(BuildContext context){
    return MediaQuery.of(context).size.width >= 500;
  }

  static bool checkPlatform(){
    bool kisweb;
    try{
      if(Platform.isAndroid) {
        kisweb=false;
      } else {
        kisweb=true;
      }
    } catch(e){
      kisweb=true;
    }
    return kisweb;
  }


  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    if (size.width >= 700){
      return web;
    } else{
      return mobile;
    }




    // if(size.width >= 1024){
    //   return web;
    // }else if(size.width >= 700 && tablet != null){
    //   return tablet!;
    // }else if (size.width >= 450 && mobileLarge != null){
    //   return mobileLarge!;
    // }else{
    //   return mobile;
    // }
  }
}
