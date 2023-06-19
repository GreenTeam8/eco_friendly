import 'package:eco_friendly/helpers/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/cart_controller.dart';
import '../../helpers/size_config.dart';


class CartItemWidget extends StatelessWidget {
  final String cartItemId;
  final String productId;
  final double price;
  final int quantity;
  final String title;
  //final String img;

   CartItemWidget(this.cartItemId, this.productId, this.title, this.quantity, this.price,
     // this.img,
      {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double height = SizeConfig.screenHeight!;
    double width = SizeConfig.screenWidth!;
    return Dismissible(
      key: ValueKey(cartItemId),
      background: Container(
        color: Theme.of(context).errorColor,
        child: Icon(Icons.delete, size: 40, color: Colors.white,),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
      ),
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction){
        return showDialog(context: context, builder: (ctx) {
          return AlertDialog(title: Text('Are you sure?'),
            content: Text('You are about to delete the item'),
            actions: [
              TextButton(child: Text('Yes'),
                onPressed: (){
                  Navigator.of(ctx).pop(true);
                },),
              TextButton(child: Text('No'),
                onPressed: (){
                  Navigator.of(ctx).pop(false);
                },),
            ],
          );
        },);
      },
      onDismissed: (direction) {
        Provider.of<CartController>(context, listen: false).removeItem(productId);
      },
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        child: Padding(padding: EdgeInsets.all(8),
          child: ListTile(
            leading: CircleAvatar(
                backgroundColor: mainColor,
                radius: width * 0.1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:
                  //Image.network(img)
                  FittedBox(child: Text('${price}\$', style: Theme.of(context).textTheme.bodyText2!.copyWith(color: Colors.white),)),
                )
            ),
            title: Text(title),
            subtitle: Text('Total: ${price*quantity}\$'),
            trailing: Text('${quantity} X'),

          ),
        ),
      ),
    );
  }
}
