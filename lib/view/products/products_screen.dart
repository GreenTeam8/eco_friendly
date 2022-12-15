import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:eco_friendly/controller/products_controller.dart';

import '../../model/product.dart';
import '../../zhelpers/size_config.dart';
import 'product_widget_mobile.dart';

class ProductsScreen extends StatelessWidget {
  static const PRODUCTS_ROUTE_NAME = '/products_screen';
  String? productCategoryId;
  List<Product>? fetchedProducts;

  ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    //double height = SizeConfig.screenHeight!;
    double width = SizeConfig.screenWidth!;
    final Map routeArguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, String?>;

    ///appliances or electronics or plastic ban or plants
    productCategoryId = routeArguments['CategoryId'];
    final loadedProducts = Provider.of<ProductController>(context)
        .findAllProductsById(productCategoryId!);

    return Scaffold(
      ///Design for web and mobile
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: EdgeInsets.all(width * 0.02),
                child: Text(
                  productCategoryId!.toUpperCase(),
                  style: Theme.of(context).textTheme.bodyText1,
                )),
            Expanded(
              child: ListView.builder(
                itemCount: loadedProducts.length,

                /// length of products
                // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                //   crossAxisCount: width <= 1000 ? 1 : 3,
                //   childAspectRatio:  3 / 2,
                //   crossAxisSpacing: 10,
                //   mainAxisSpacing: 10,
                // ),
                itemBuilder: (context, index) {
                  return ChangeNotifierProvider.value(
                      value: loadedProducts[index],
                      child: ProductWidgetMobile());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
