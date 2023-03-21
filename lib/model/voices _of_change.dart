import 'package:flutter/material.dart';

class VoicesOfChange with ChangeNotifier{
  String? VoiceImage;
  String? VoiceName;
  String? VoiceNameAr;
  String? VoiceDescription;
  String? VoiceDescriptionAr;

  VoicesOfChange({
    this.VoiceImage,
    this.VoiceName,
    this.VoiceNameAr,
    this.VoiceDescription,
    this.VoiceDescriptionAr,
  });
}