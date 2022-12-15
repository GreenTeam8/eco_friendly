import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/product.dart';
import '../../zhelpers/size_config.dart';
import '../../zhelpers/constants.dart';
import 'product_detail_widget.dart';

class ProductWidgetMobile extends StatelessWidget {
  const ProductWidgetMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double height = SizeConfig.screenHeight!;
    double width = SizeConfig.screenWidth!;
    final product = Provider.of<Product>(context, listen: false);

    ///as gridtile view different approach of view
    // return Container(
    //   padding:  EdgeInsets.all(width * 0.02),
    //   decoration: BoxDecoration(
    //     color: Colors.white,
    //       boxShadow: [
    //         BoxShadow(
    //           //color: productItem[index].color!.withOpacity(0.60),
    //             color: Colors.black26.withOpacity(0.20),
    //             offset: const Offset(-10, 10),
    //             blurRadius: 10)
    //       ]
    //   ),
    //   child: ClipRRect(
    //     borderRadius: BorderRadius.circular(12),
    //     child: GridTile(
    //       footer:GridTileBar(
    //         backgroundColor: Colors.black87.withOpacity(0.8),
    //         /// added consumer to manipulate the favorites
    //         leading: Consumer<Product>(
    //             builder: (context, value, child) {
    //               return IconButton(
    //                 icon: Icon(Icons.favorite_border,),
    //                 color: kPC,
    //                 onPressed: (){
    //                 },
    //               );
    //             }),
    //         title: Text(product.productName!, textAlign: TextAlign.center, style: TextStyle(fontSize: 16),),
    //         trailing: IconButton(
    //             icon:  Icon(Icons.shopping_cart),
    //             color: kPC,
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
    //           child: Image.network(product.productImage!,fit: BoxFit.contain)),
    //     ),
    //   ),
    // );
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          ProductDetailsWidget.PRODUCTS_DETAILS_ROUTE_NAME,
          arguments: {'ProductId': product.productId},
        );
      },
      child: Container(
        height: height * 0.2,
        margin: EdgeInsets.all(height * 0.01),
        padding: EdgeInsets.all(height * 0.01),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                  //color: productItem[index].color!.withOpacity(0.60),
                  color: Colors.black26.withOpacity(0.20),
                  offset: const Offset(6, 6),
                  blurRadius: 20
              )
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                padding: EdgeInsets.all(height * 0.01),
                width: width * 0.4,
                child:
                    Image.network(product.productImage!, fit: BoxFit.contain)),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.productName!,
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.grey[700]),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.all(width * 0.01),
                    child: Text(
                      '${product.productPrice!}' ' \$',
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.grey[600]),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                          icon: Icon(Icons.shopping_cart),
                          color: kPC,
                          onPressed: () {}),
                      IconButton(
                        icon: Icon(
                          Icons.favorite_border,
                        ),
                        color: Colors.red,
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
