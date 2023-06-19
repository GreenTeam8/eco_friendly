

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../helpers/constants.dart';
import '../../../helpers/size_config.dart';
import '../../../model/order.dart';


class OrderItemWidget extends StatefulWidget {
  final Order order;

  const OrderItemWidget(this.order, {Key? key}) : super(key: key);

  @override
  State<OrderItemWidget> createState() => _OrderItemWidgetState();
}

class _OrderItemWidgetState extends State<OrderItemWidget> {
  var _showOrderDetails = false;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double height = SizeConfig.screenHeight!;
    double width = SizeConfig.screenWidth!;
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            leading: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/cash.png', height: height * 0.03, width: width * 0.1,),
                Text('Cash on delivery', ),
              ],
            ),
            title: Text('${'Total Amount: '}''${widget.order.amount} \$'),
            subtitle: Text(DateFormat('dd/MM/yyyy hh:mm').format(widget.order.dateTime)),
            trailing: IconButton(icon: Icon(_showOrderDetails ? Icons.expand_less: Icons.expand_more),
                onPressed: (){
                  setState(() {
                    _showOrderDetails = !_showOrderDetails;
                  });
                }),
          ),
          if(_showOrderDetails) Container(
            padding: EdgeInsets.symmetric(horizontal: width * 0.02, vertical: 5),
            height: height * 0.3,
            //height: min(widget.orderItem.products.length * 20 + 10, 100),
            child: ListView(
              children:
            widget.order.products.map((product) => Column(
              children: [
                Text(product.itemTitle, overflow: TextOverflow.ellipsis ,style: Theme.of(context).textTheme.bodyText2),
                Text('${product.quantity} * ${product.price}\$', style: Theme.of(context).textTheme.bodyText2!.copyWith(color: Colors.grey),),
                Divider(color: mainColor, thickness: 1, indent: 20, endIndent: 20,),
              ],
            )).toList(),
            ),
          )
        ],
      ),
    );
  }
}
