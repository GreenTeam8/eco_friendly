import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:provider/provider.dart';

import '../../../controller/authentication_controller.dart';
import '../../../controller/cart_controller.dart';
import '../../../controller/products_controller.dart';
import '../../../helpers/constants.dart';
import '../../../helpers/size_config.dart';
import '../../profile/register_screen.dart';

class ProductDetailsWeb extends StatelessWidget {
  static const PRODUCTS_DETAILS_WEB_ROUTE_NAME = '/productsDetailsWebScreen';
  const ProductDetailsWeb({Key? key}) : super(key: key);

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
    return WillPopScope(
      onWillPop: () async => true,
      child: Scaffold (
        body: SafeArea(
          child: Stack(
            children: [
              Container(
                width: width,
                margin: EdgeInsets.all(width * 0.05),
                //height: height* 0.5,
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        padding: EdgeInsets.all(height * 0.01),
                        margin: EdgeInsets.only(right: width * 0.01),
                        width: width * 0.3,
                        decoration: BoxDecoration(
                            border: Border.all(color: mainColor,),
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Hero(
                          tag: 'heroImage${product.productId}',
                          child: Image.network(
                            product.productImage!,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),),
                    Divider(height: height * 0.2, color: mColor,),
                    Expanded(
                      flex: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Hero(
                            tag: 'heroName${product.productId}',
                            child: Text(
                              product.productName!,
                              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                fontWeight: FontWeight.w800,
                                overflow: TextOverflow.ellipsis,
                                fontSize: 20
                              ),
                            ),
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                  width: width * 0.05,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: mainColor),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Hero(
                                    tag: 'heroPrice${product.productId}',
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
                                )
                              ]),
                          Text(
                            'Description:-',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            product.productDescription!,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                            ,
                          ),
                          Consumer<AuthenticationController>(
                            builder: (context, value, child) =>  Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                  icon: Icon(
                                    product.isFavorite ? Icons.favorite : Icons.favorite_border,
                                  ),
                                  color: Colors.red,
                                  onPressed: () {
                                    if (auth.isAuth) {
                                      product.toggleFavoriteStatue(
                                        auth.token!,
                                        auth.userId!,
                                      );
                                    }
                                    if (product.isFavorite == false) {
                                      delFavProduct.deleteFavProduct(
                                          auth.userId, product.productId!);
                                    } else {
                                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                        content: Text(
                                          'Please Sign In !',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText2!
                                              .copyWith(color: mainColor),
                                        ),
                                        duration: Duration(seconds: 3),
                                      ));
                                    }
                                  },
                                ),
                                ElevatedButton(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                        Icon(Icons.add_shopping_cart),
                                        Text('Add to Cart')
                                        ],
                                    ),
                                    style: ButtonStyle(
                                        elevation: MaterialStateProperty.all(0),
                                        backgroundColor: MaterialStateProperty.all(mColor),
                                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20))),
                                        padding: MaterialStateProperty.all(EdgeInsets.all(height * 0.02))),
                                    onPressed: (){
                                      if(value.isAuth){
                                        cart.addItem(product.productId!, product.productPrice!, product.productName!);
                                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
                                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                          content: Text('Item added to cart!',style: Theme.of(context).textTheme.bodyText2!.copyWith(color: pColor)),
                                          duration: Duration(seconds: 3),
                                          action: SnackBarAction(label: 'Undo',
                                              onPressed: (){
                                                cart.removeSingleItem(product.productId!);
                                              }),
                                        )
                                        );
                                      }else{
                                        Navigator.pushNamed(context, RegisterScreen.REGISTERSCREEN_ROUTE_NAME);
                                      }
                                    }, ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                child: ClipPath(
                  child: Container(
                    color: mColor,
                    width: width,
                    height: height! * 0.3,
                  ),
                  clipper: OvalTopBorderClipper(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
