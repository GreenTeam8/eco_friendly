import 'package:eco_friendly/controller/authentication_controller.dart';
import 'package:eco_friendly/view/cart/cart_item_widget.dart';
import 'package:eco_friendly/view/cart/order_button.dart';
import 'package:eco_friendly/helpers/constants.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../controller/cart_controller.dart';
import '../../helpers/responsive.dart';
import '../../helpers/size_config.dart';
import '../Home/home_screen.dart';

class CartScreen extends StatelessWidget {

  static const String CART_SCREEN_ROUTE_NAME = '/cartScreen';

  CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double height = SizeConfig.screenHeight!;
    double width = SizeConfig.screenWidth!;
    final cart = Provider.of<CartController>(context);
    return Scaffold(
      appBar: AppBar(
          title: Text('Your Cart', style: Theme.of(context).textTheme.bodyText1,),
        leading:  Responsive.checkPlatform() ? IconButton(
          icon: Icon(Icons.arrow_back_ios, color: mainColor, size: 25),
          onPressed: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen(),));
          },
        )
            : null,
      ),
      body: Consumer<AuthenticationController>(
        builder: (context, value, child) =>
           value.isAuth ? Column(
            children: [
              cart.items.length > 0
              ?Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) => CartItemWidget(
                        cart.items.values.toList()[index]!.itemId,
                        cart.items.keys.toList()[index],
                        cart.items.values.toList()[index]!.itemImage!,
                        cart.items.values.toList()[index]!.itemTitle,
                        cart.items.values.toList()[index]!.quantity,
                        cart.items.values.toList()[index]!.price,
                    ),

                    itemCount: cart.items.length,))
              :Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   Responsive.checkPlatform() ? Image.asset('assets/images/staticCart.png', height: height * 0.3,):Lottie.asset('assets/lottie/cart.json',height: height * 0.3,),
                    Text('Your cart is empty!', style: Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.grey),)
                  ],
                ),
              ),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: width * 0.02),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.asset('assets/images/swipe.png', height: height * 0.05, color: mainColor,),
                    SizedBox(width: width * 0.01,),
                    Text('Swipe item left to delete', style: Theme.of(context).textTheme.bodyText2!.copyWith(color: Colors.grey),)
                  ],
                ),
              ),
              Card(
                margin: EdgeInsets.all(height * 0.01),
                child: Padding(
                  padding: EdgeInsets.all(height * 0.01),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Total', style: Theme.of(context).textTheme.bodyText2!,),
                        Spacer(),
                        Chip(
                          label: Text('${cart.totalAmount.toStringAsFixed(1)}\$',
                            style: Theme.of(context).textTheme.bodyText2!.copyWith(color: Colors.white, fontWeight: FontWeight.w900),),
                          backgroundColor: mColor,),
                        OrderButton(cart: cart),

                      ]
                  ),

                ),
              ),
            ])
               : Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Center(
                   child: Responsive.checkPlatform() ? Image.asset('assets/images/staticCart.png'):Lottie.asset('assets/lottie/cart.json',height: height * 0.3)),
               Text('Your cart is empty!', style: Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.grey),)
             ],
           ),
      ),
    );
  }
}



