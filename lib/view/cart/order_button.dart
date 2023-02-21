import 'package:eco_friendly/helpers/constants.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../controller/cart_controller.dart';
import '../../controller/orders_controller.dart';

class OrderButton extends StatefulWidget {
  const OrderButton({
    Key? key,
    required this.cart,
  }) : super(key: key);

  final CartController cart;

  @override
  State<OrderButton> createState() => _OrderButtonState();
}

class _OrderButtonState extends State<OrderButton> {
  var _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: (widget.cart.totalAmount <= 0 ||  _isLoading) ? null :() async{
          setState(() {
            _isLoading = true;
          });
          await Provider.of<OrdersController>(context, listen: false).addOrder(widget.cart.items.values.toList(), widget.cart.totalAmount);
          setState(() {
            _isLoading = false;
          });
          widget.cart.clearCart();
        }, child:_isLoading ? Lottie.asset('assets/lottie/loading.json', height: 60)
        : Text('Check out', style: Theme.of(context).textTheme.bodyText2!.copyWith(color: mainColor, fontWeight: FontWeight.bold),));
  }
}