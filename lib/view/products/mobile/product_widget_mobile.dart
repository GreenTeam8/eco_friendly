import 'package:eco_friendly/controller/authentication_controller.dart';
import 'package:eco_friendly/controller/cart_controller.dart';
import 'package:eco_friendly/controller/products_controller.dart';
import 'package:eco_friendly/view/products/mobile/product_detail_mobile.dart';
import 'package:eco_friendly/view/profile/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../helpers/constants.dart';
import '../../../helpers/size_config.dart';
import '../../../model/product.dart';


class ProductWidgetMobile extends StatelessWidget {
  const ProductWidgetMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double height = SizeConfig.screenHeight!;
    double width = SizeConfig.screenWidth!;
    final product = Provider.of<Product>(context,listen: false);
    final cart = Provider.of<CartController>(context, listen: false);
    final auth = Provider.of<AuthenticationController>(context,listen: false);
    final delFavProduct = Provider.of<ProductController>(context,listen: false);

    // ///as gridtile view different approach of view
    // return Container(
    //   padding:  EdgeInsets.all(width * 0.02),
    //   decoration: BoxDecoration(
    //     //color: Colors.white,
    //       boxShadow: [
    //         BoxShadow(
    //          // color: productItem[index].color!.withOpacity(0.60),
    //            color: Colors.black26.withOpacity(0.20),
    //             offset: const Offset(10, 10),
    //             blurRadius: 10
    //         )
    //       ]
    //   ),
    //   child: ClipRRect(
    //     borderRadius: BorderRadius.circular(12),
    //     child: GridTile(
    //       footer:GridTileBar(
    //         backgroundColor: Colors.black87.withOpacity(0.6),
    //         /// added consumer to manipulate the favorites
    //         leading: Consumer<Product>(
    //             builder: (context, value, child) {
    //               return IconButton(
    //                 icon: Icon(Icons.favorite_border,),
    //                 color: pColor,
    //                 onPressed: (){
    //                 },
    //               );
    //             }),
    //         title: Text(product.productName!, textAlign: TextAlign.center, style: TextStyle(fontSize: 16),),
    //         trailing: IconButton(
    //             icon:  Icon(Icons.shopping_cart),
    //             color: pColor,
    //             onPressed: (){
    //             }),
    //       ),
    //       child: InkWell(
    //           onTap: (){
    //               Navigator.of(context).pushNamed(ProductDetailsWidget.PRODUCTS_DETAILS_ROUTE_NAME,arguments: {
    //                 'ProductId': product.productId
    //               },);
    //
    //           } ,
    //           child: Image.network(product.productImage!,fit: BoxFit.cover)),
    //     ),
    //   ),
    // );
    return Column(
      children: [
        InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductDetailsMobile.PRODUCTS_DETAILS_MOBILE_ROUTE_NAME,
              arguments: {'ProductId': product.productId},
            );
          },
          child: Container(
            height: height * 0.30,
            margin: EdgeInsets.all(height * 0.01),
            padding: EdgeInsets.all(height * 0.01),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
               ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    padding: EdgeInsets.all(height * 0.01),
                    margin: EdgeInsets.only(right: width * 0.01),
                    width: width * 0.3,
                    decoration: BoxDecoration(
                      border: Border.all(color: mainColor,),
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Hero(
                        tag: 'hero${product.productId}',
                        child: Image.network(product.productImage!, fit: BoxFit.contain, width: 150, height: 150,))),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Hero(
                        tag: 'heroText${product.productId}',
                        child: Text(
                          product.productName!,
                          style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              fontWeight: FontWeight.bold,
                              ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.all(width * 0.01),
                        child: Hero(
                          tag: 'heroPrice${product.productId}',
                          child: Text(
                            '${product.productPrice!}' ' \$',
                            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                      ),
                      Text(
                        product.productDescription!,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Spacer(),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Consumer<AuthenticationController>(
                            builder: (context, value, child)=>
                            IconButton(
                                icon: Icon(Icons.shopping_cart),
                                color: mColor,
                                onPressed: () {
                                  if(value.isAuth){
                                    cart.addItem(product.productId!, product.productPrice!, product.productName!);
                                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
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
                                      content: Text('Please Sign In !', style: Theme.of(context).textTheme.bodyText2!.copyWith(color: mainColor),),
                                      duration: Duration(seconds: 3),
                                    )
                                    );
                                  }

                                }),
                          ),
                          Consumer<Product>(
                            builder: (context, value, child) =>
                         IconButton(
                                  icon: Icon(
                                    product.isFavorite ? Icons.favorite : Icons.favorite_border,
                                  ),
                                  color: Colors.red,
                                  onPressed: () {
                                    if(auth.isAuth){
                                      product.toggleFavoriteStatue(auth.token!, auth.userId!,);
                                     }
                                      // if(product.isFavorite == false){
                                      //   delFavProduct.deleteFavProduct(auth.userId, product.productId!);
                                      // }
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
        Divider(
          color: mainColor,
          thickness: 1,
          indent: 20,
          endIndent: 20,
        ),
      ],
    );
  }
}
