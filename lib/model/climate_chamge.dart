import 'package:flutter/cupertino.dart';

class ClimateChange with ChangeNotifier {
  String? Id;
  String? name;
  String? nameAr;
  String? image;
  String? Atitle;
  String? AtitleAr;
  String? Adescription;
  String? AdescriptionAr;
  String? Aimage;
  String? Btitle;
  String? BtitleAr;
  String? Bdescription;
  String? BdescriptionAr;
  String? Bimage;
  String? Ctitle;
  String? CtitleAr;
  String? Cdescription;
  String? CdescriptionAr;
  String? Cimage;
  String? Dtitle;
  String? DtitleAr;
  String? Ddescription;
  String? DdescriptionAr;
  String? Dimage;
  String? ItemId;
  String? ItemTitle;
  String? ItemTitleAr;
  String? ItemDescriptionAr;
  String? ItemDescription;
  String? ItemCategory;

  ClimateChange(
      {this.Id,
      this.name,
      this.nameAr,
      this.image,
      this.Atitle,
      this.AtitleAr,
      this.Adescription,
      this.AdescriptionAr,
      this.BdescriptionAr,
      this.CdescriptionAr,
      this.DdescriptionAr,
      this.Aimage,
      this.Btitle,
      this.BtitleAr,
      this.Bdescription,
      this.Bimage,
      this.Ctitle,
      this.CtitleAr,
      this.Cdescription,
      this.Cimage,
      this.Dtitle,
      this.DtitleAr,
      this.Ddescription,
      this.Dimage,
      this.ItemId,
      this.ItemTitle,
      this.ItemTitleAr,
      this.ItemDescriptionAr,
      this.ItemDescription,
      this.ItemCategory});
}
