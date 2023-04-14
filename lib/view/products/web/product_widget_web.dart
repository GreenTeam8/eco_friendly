import 'package:eco_friendly/main.dart';
import 'package:eco_friendly/view/products/web/product_details_web.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controller/authentication_controller.dart';
import '../../../controller/cart_controller.dart';
import '../../../controller/products_controller.dart';
import '../../../helpers/constants.dart';
import '../../../helpers/size_config.dart';
import '../../../model/product.dart';
import '../../profile/register_screen.dart';
import '../mobile/product_detail_mobile.dart';

class ProductWidgetWeb extends StatelessWidget {
  //int index;
  ProductWidgetWeb({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double height = SizeConfig.screenHeight!;
    double width = SizeConfig.screenWidth!;
    final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<CartController>(context, listen: false);
    final auth = Provider.of<AuthenticationController>(context, listen: false);
    final delFavProduct =
    Provider.of<ProductController>(context, listen: false);

    ///as gridtile view different approach of view
    return Container(
      padding: EdgeInsets.all(width * 0.02),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: GridTile(
          footer: GridTileBar(
            backgroundColor: Colors.black87.withOpacity(0.4),

            /// added consumer to manipulate the favorites
            leading:  IconButton(
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
            title: Hero(
                tag: 'heroName${product.productId}',
                child: Text(
                  product.productName!,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20),
                )),
            subtitle:Hero(
                tag: 'heroPrice${product.productId}',
                child: Text(
                  '${product.productPrice!}' ' \$',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                )),
            trailing: IconButton(
                icon: Icon(Icons.shopping_cart),
                color: mColor,
                onPressed: () {
                  if(auth.isAuth){
                    cart.addItem(product.productId!, product.productPrice!, product.productName!);
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    ScaffoldMessenger.of(context).showSnackBar( SnackBar(
                      content: Text('Item added to cart!',style: Theme.of(context).textTheme.bodyText2!.copyWith(color: mainColor)),
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
                }),
          ),
          child: InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(
                  ProductDetailsWeb.PRODUCTS_DETAILS_WEB_ROUTE_NAME,
                  arguments: {'ProductId': product.productId},
                );
              },
              child: Hero(
                  tag: 'heroImage${product.productId}',
                  child: Image.network(
                    product.productImage!,
                    fit: BoxFit.contain,
                  ))),
        ),
      ),
    );
  }
}