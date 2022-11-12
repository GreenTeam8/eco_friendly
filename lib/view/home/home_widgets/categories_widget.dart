import 'dart:async';

import 'package:eco_friendly/constants.dart';
import 'package:eco_friendly/size_config.dart';
import 'package:flutter/material.dart';

import '/model/dummy_product_list.dart';


class Categories extends StatefulWidget {

  /// DEPRECATED

   Categories({Key? key}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  int _selectedIndex = 0;


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double height = SizeConfig.screenHeight! ;
    double width = SizeConfig.screenWidth! ;
    return Container(
      height: height * 0.1,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: productItem.length,
        itemBuilder: (context, index) {
        return GestureDetector(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kPadding/2, vertical: kPadding/2),
            child: Container(
              margin: const EdgeInsets.only(right: kMargin),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.black,
                      width: width * 0.015,
                      style: _selectedIndex == index ? BorderStyle.solid : BorderStyle.none
                    )
                  )
              ),
              child: Text(productItem[index].name, style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 30,
                  color: _selectedIndex == index ? Colors.black : Colors.grey,
                  letterSpacing: 1.2,
              ),),
            ),
          ),
          onTap: (){
            setState(() {
              _selectedIndex = index;
            });

          },
        );
      },),
    );
  }


}
