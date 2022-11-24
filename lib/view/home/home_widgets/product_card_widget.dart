import 'package:eco_friendly/controller/home_controller.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class ProductCardWidget extends StatelessWidget {

  HomeController controller;
  int index;
  ProductCardWidget({required this.controller,required this.index,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double height = SizeConfig.screenHeight!;
    double width = SizeConfig.screenWidth!;

    return InkWell(
      onTap: () {},
      splashColor: kPC,
      focusColor: kPC,
      child: Container(
        alignment: Alignment.bottomLeft,
        width: width * 0.90,
        margin: EdgeInsets.all(height * 0.01),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(100),
                bottomRight: Radius.circular(100)),
           // color: controller.productsList[index].color,
            image: DecorationImage(
                image: AssetImage('assets/images/'
                    '${controller.productsList[index].image}'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.25),
                    BlendMode.multiply)),
            boxShadow: [
              BoxShadow(
                //color: productItem[index].color!.withOpacity(0.60),
                  color: Colors.black26.withOpacity(0.30),
                  offset: const Offset(-10, 10),
                  blurRadius: 10)
            ]),
        child: Padding(
          padding: EdgeInsets.all(width * 0.01),
          child: Text(
            controller.productsList[index].name,
            style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
        ),
      ),
    );
  }
}
