import 'package:eco_friendly/view/home/home_widgets/product_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '/controller/home_controller.dart';
import '../../../../../size_config.dart';

class ProductCardWeb extends StatelessWidget {
  const ProductCardWeb({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double height = SizeConfig.screenHeight!;
    double width = SizeConfig.screenWidth!;

    return GetBuilder(
      init: HomeController(),
      builder: (controller) {
        return  Container(
                width: width,
                height: height * 0.7 ,
                child: GridView.builder(
                  itemCount: controller.productsList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 3 / 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 1,
                  ),
                  itemBuilder: (context, index) {
                    return ProductCardWidget(controller: controller, index: index);
                  },
                ),
              );
      },
    );
  }
}
