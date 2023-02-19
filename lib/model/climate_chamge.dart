import 'package:flutter/cupertino.dart';

class ClimateChange with ChangeNotifier {
  String? Id;
  String? name;
  String? image;
  String?Atitle,Adescription,Aimage,Btitle,Bdescription,Bimage,Ctitle,Cdescription,Cimage,Dtitle,Ddescription,Dimage;
  String? ItemId;
  String? ItemTitle;
  String? ItemImage;
  String? ItemDescription;
  String? ItemCategory;

  ClimateChange({
    this.Id,
    this.name,
    this.image,
    this.Atitle,
    this.Adescription,
    this.Aimage,
    this.Btitle,
    this.Bdescription,
    this.Bimage,
    this.Ctitle,
    this.Cdescription,
    this.Cimage,
    this.Dtitle,
    this.Ddescription,
    this.Dimage,
    this.ItemId,
    this.ItemTitle,
    this.ItemImage,
    this.ItemDescription,
    this.ItemCategory});
}
