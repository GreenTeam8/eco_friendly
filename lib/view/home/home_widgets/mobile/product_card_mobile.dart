import 'package:eco_friendly/view/home/home_widgets/product_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '/controller/home_controller.dart';
import '../../../../size_config.dart';
class ProductCardMobile extends StatelessWidget {
  const ProductCardMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double height = SizeConfig.screenHeight!;
    double width = SizeConfig.screenWidth!;

    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) {
          return Container(
            height: height * 0.30,
            width: width ,
            margin: EdgeInsets.only(top: height * 0.01),
            child: ListView.builder(
              itemCount: controller.productsList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return ProductCardWidget(controller: controller, index: index);
              },
            ),
          );
        },);
  }
}
