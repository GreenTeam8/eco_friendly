import 'package:eco_friendly/controller/authentication_controller.dart';
import 'package:eco_friendly/controller/products_controller.dart';
import 'package:eco_friendly/helpers/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:provider/provider.dart';

import '../../../controller/cart_controller.dart';
import '../../../helpers/size_config.dart';
import '../../profile/register_screen.dart';

class ProductDetailsMobile extends StatelessWidget {
  static const PRODUCTS_DETAILS_MOBILE_ROUTE_NAME = '/productsDetailsMobileScreen';

  ProductDetailsMobile({Key? key}) : super(key: key);

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
    final cart = Provider.of<CartController>(context, listen: false);
    final delFavProduct = Provider.of<ProductController>(context,listen: false);
    final auth = Provider.of<AuthenticationController>(context,listen: false);

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            ClipPath(
              child: Container(
                color: mColor,
                width: width,
                height: height! * 0.4,
              ),
              clipper: OvalBottomBorderClipper(),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: width * 0.05, vertical: height * 0.03),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(18),
                          child: Container(
                            decoration:
                                BoxDecoration(
                                    color: Colors.white,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(18),
                              child: Container(
                                width: width,
                                height: height * 0.45,
                                child: Hero(
                                  tag: 'hero${product.productId}',
                                  child: Image.network(
                                    product.productImage!,
                                    fit: BoxFit.contain,


                                  ),
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
                                    color: mColor,
                                    size: 25,
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                                IconButton(
                                  icon: Icon(product.isFavorite ? Icons.favorite : Icons.favorite_border,
                                      color: Colors.red, size: 25),
                                  onPressed: () {
                                    if(auth.isAuth){
                                      product.toggleFavoriteStatue(auth.token!, auth.userId!,);
                                    }
                                    if(product.isFavorite == false){
                                      delFavProduct.deleteFavProduct(auth.userId, product.productId!);
                                    }
                                    else{
                                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                        content: Text('Please Sign In !', style: Theme.of(context).textTheme.bodyText2!.copyWith(color: mainColor),),
                                        duration: Duration(seconds: 3),
                                      )
                                      );
                                    }


                                  },
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
                        Divider(color: pColor, height: height * 0.03),
                        Hero(
                          tag: 'heroText${product.productId}',
                          child: Text(
                            product.productName!,
                            maxLines: 2,
                            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                fontWeight: FontWeight.w800,
                                overflow: TextOverflow.ellipsis,
                               ),
                          ),
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
                                    border: Border.all(color: mainColor),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Hero(
                                    tag: 'heroPrice${product.productId}',
                                    child: FittedBox(
                                      child: Text(
                                        '${product.productPrice}' ' \$',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2!
                                            .copyWith(
                                                fontWeight: FontWeight.w800,
                                                ),
                                      ),
                                    ),
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
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                        child: Text(
                      product.productDescription!,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          ,
                    )),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Consumer<AuthenticationController>(
        builder: (context, value, child) => ElevatedButton(
          child: Icon(Icons.add_shopping_cart),
          style: ButtonStyle(
              elevation: MaterialStateProperty.all(0),
              backgroundColor: MaterialStateProperty.all(mColor),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30))),
              padding: MaterialStateProperty.all(EdgeInsets.all(height * 0.03))),
          onPressed: () {
            if(value.isAuth){
              cart.addItem(product.productId!, product.productPrice!, product.productName!,product.productImage!);
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar( SnackBar(
                content: Text('Item added to cart!',style: Theme.of(context).textTheme.bodyText2!.copyWith(color: pColor)),
                duration: Duration(seconds: 3),
                action: SnackBarAction(label: 'Undo',
                    onPressed: (){
                      cart.removeSingleItem(product.productId!);
                    }),
              )
              );
            }else{
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('Please Sign In !', style: Theme.of(context).textTheme.bodyText2!.copyWith(color: mainColor),),
                duration: Duration(seconds: 3),
              )
              );
            }
          },
        ),
      ),
    );
  }
}
