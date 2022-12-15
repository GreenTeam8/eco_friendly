import 'package:eco_friendly/controller/products_controller.dart';
import 'package:eco_friendly/zhelpers/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../zhelpers/size_config.dart';

class ProductDetailsWidget extends StatelessWidget {
  static const PRODUCTS_DETAILS_ROUTE_NAME = '/productsDetailsScreen';

  ProductDetailsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double height = SizeConfig.screenHeight!;
    double width = SizeConfig.screenWidth!;
    final routeArguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, String?>;

    ///p1,p2 p3.....
    final productId = routeArguments['ProductId'];
    final product =
        Provider.of<ProductController>(context).findProductById(productId!);

    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(
              horizontal: width * 0.05, vertical: height * 0.03),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        decoration:
                            BoxDecoration(color: Colors.white, boxShadow: [
                          BoxShadow(
                              color: Colors.black26.withOpacity(0.10),
                              offset: const Offset(6, 6),
                              blurRadius: 20)
                        ]),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            width: width,
                            height: height * 0.45,
                            child: Image.network(
                              product.productImage!,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(width * 0.04),
                      child: Container(
                        alignment: Alignment.topCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.arrow_back_ios,
                                color: kPC,
                                size: 35,
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.favorite_border,
                                  color: kPC, size: 35),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: height * 0.02,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      product.productName!,
                      maxLines: 2,
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          fontWeight: FontWeight.w800,
                          overflow: TextOverflow.ellipsis,
                          fontSize: 20,
                          color: Colors.grey[600]),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: height * 0.02, bottom: height * 0.02),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                ...List.generate(5, (index) {
                                  return Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                  );
                                }),
                              ],
                            ),
                            Container(
                              height: height * 0.07,
                              width: width * 0.2,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: kPC,
                              ),
                              child: Text(
                                '${product.productPrice}' ' \$',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2!
                                    .copyWith(
                                        fontWeight: FontWeight.w800,
                                        color: Colors.white),
                              ),
                            )
                          ]),
                    )
                  ],
                ),
              ),
              Text(
                'Description:-',
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(color: kPC, fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: SingleChildScrollView(
                    child: Text(
                  product.productDescription!,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2!
                      .copyWith(color: Colors.grey[600]),
                )),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: ElevatedButton(
        child: Icon(Icons.add_shopping_cart),
        style: ButtonStyle(
            elevation: MaterialStateProperty.all(10),
            backgroundColor: MaterialStateProperty.all(kPC),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30))),
            padding: MaterialStateProperty.all(EdgeInsets.all(height * 0.03))),
        onPressed: () {},
      ),
    );
  }
}
