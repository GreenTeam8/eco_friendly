import 'package:eco_friendly/controller/climate_change_controller.dart';
import 'package:eco_friendly/helpers/constants.dart';
import 'package:eco_friendly/helpers/size_config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'climate_change_mobile.dart';

class ClimateChangeDetailMobil extends StatefulWidget {
  static const CLIMATE_DETAILS_MOBILE_ROUTE_NAME = '/ClimateChangeDetail';

  ClimateChangeDetailMobil({Key? key}) : super(key: key);

  @override
  State<ClimateChangeDetailMobil> createState() =>
      _ClimateChangeDetailMobilState();
}

class _ClimateChangeDetailMobilState extends State<ClimateChangeDetailMobil> {
  String? ItemCategoryId;
  bool isShowmore = true;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.screenWidth!;
    double height = SizeConfig.screenHeight!;
    final Map routeArguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, String?>;

    ItemCategoryId = routeArguments['Id'];
    final loadedItems = Provider.of<ClimateChangeController>(context)
        .findItemsById(ItemCategoryId!);
    // void transs(){
    //   setState(() {
    //     dataToTrans=loadedItems.ItemImage!;
    //     print(dataToTrans);
    //   });
    //
    // }
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(top: height * 0.020),
                width: width * 0.90,
                height: height * 0.40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      loadedItems.image!,
                    ),
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: 10,
                      left: 10,
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                          size: 25,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.020,
              ),
              Container(
                width: width,
                height: height * 0.35,
                decoration: BoxDecoration(
                  color: Colors.green[100],
                ),
                child: Container(
                  padding: EdgeInsets.all(height * 0.020),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            transs?loadedItems.name!:loadedItems.nameAr!,
                            style:
                                Theme.of(context).textTheme.bodyMedium!.copyWith(
                                      color: mainColor,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                        ),
                        Text(
                          transs ? loadedItems.ItemDescription! : loadedItems.ItemDescriptionAr!,
                          style:
                              Theme.of(context).textTheme.bodyText2!.copyWith(
                                    color: Colors.grey[800],
                                    // fontSize: 20,
                                  ),
                          maxLines: isShowmore ? 4 : null,
                          overflow: TextOverflow.clip,
                          textAlign: TextAlign.justify,
                        ),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              isShowmore = !isShowmore;
                            });
                          },
                          child: Text(
                            isShowmore ? "Show more" : "Show less",
                            style: TextStyle(
                              fontSize: 18,
                              color: mainColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.020,
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Center(
                  child: Text(
                   transs?loadedItems.ItemTitle!:loadedItems.ItemTitleAr!,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: mainColor,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.020,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.all(10),
                          width: width * 0.90,
                          height: height * 0.40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(
                                loadedItems.Aimage!,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.020,
                        ),
                        Container(
                          width: width * 0.90,
                          height: height * 0.35,
                          child: Container(
                            color: Colors.green[50],
                            padding: EdgeInsets.all(height * 0.020),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Center(
                                    child: Text(
                                      transs?loadedItems.Atitle!:loadedItems.AtitleAr!,

                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                            color: mainColor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ),
                                  Text(
                                    transs ?loadedItems.Adescription!:loadedItems.AdescriptionAr!,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                          color: Colors.grey[800],
                                        ),
                                    overflow: TextOverflow.fade,
                                    textAlign: TextAlign.justify,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.all(10),
                          width: width * 0.90,
                          height: height * 0.40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(
                                loadedItems.Bimage!,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.020,
                        ),
                        Container(
                          width: width * 0.90,
                          height: height * 0.35,
                          decoration: BoxDecoration(
                            color: Colors.green[50],
                          ),
                          child: Container(
                            padding: EdgeInsets.all(height * 0.020),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Center(
                                    child: Text(
                                      transs?loadedItems.Btitle!:loadedItems.BtitleAr!,

                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                            color: mainColor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ),
                                  Text(
                                    transs ?loadedItems.Bdescription!:loadedItems.BdescriptionAr!,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                          color: Colors.grey[800],
                                        ),
                                    overflow: TextOverflow.fade,
                                    textAlign: TextAlign.justify,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.all(10),
                          width: width * 0.90,
                          height: height * 0.40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(
                                loadedItems.Cimage!,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.020,
                        ),
                        Container(
                          width: width * 0.90,
                          height: height * 0.35,
                          child: Container(
                            color: Colors.green[50],
                            padding: EdgeInsets.all(height * 0.020),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Center(
                                    child: Text(
                                      transs?loadedItems.Ctitle!:loadedItems.CtitleAr!,

                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                            color: mainColor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ),
                                  Text(
                                      transs ?loadedItems.Cdescription!:loadedItems.CdescriptionAr!,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                            color: Colors.grey[800],
                                          ),
                                      overflow: TextOverflow.fade,
                                      textAlign: TextAlign.justify),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.all(10),
                          width: width * 0.90,
                          height: height * 0.40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(
                                loadedItems.Dimage!,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.020,
                        ),
                        Container(
                          width: width * 0.90,
                          height: height * 0.35,
                          child: Container(
                            color: Colors.green[50],
                            padding: EdgeInsets.all(height * 0.020),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Center(
                                    child: Text(
                                      transs?loadedItems.Dtitle!:loadedItems.DtitleAr!,

                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                            color: mainColor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ),
                                  Text(
                                    transs ?loadedItems.Ddescription!:loadedItems.DdescriptionAr!,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                          color: Colors.grey[800],
                                        ),
                                    overflow: TextOverflow.fade,
                                    textAlign: TextAlign.justify,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
