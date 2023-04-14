import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;


import '../model/cart_item.dart';
import '../model/order.dart';


class OrdersController with ChangeNotifier{

  List<Order> _ordersList =[];
  final String authToken;
  final String userId;

  OrdersController(this.authToken, this.userId, this._ordersList);

  List<Order> get getOrdersList{
    return [..._ordersList];
  }

  Future<void> fetchOrders() async {
    try{
      final url = 'https://climate-change-ec951-default-rtdb.firebaseio.com/orders/$userId.json?auth=$authToken';
      final response = await http.get(Uri.parse(url));
      final extractedOrder = json.decode(response.body) as Map <String , dynamic>;
      print(extractedOrder);
      if(extractedOrder == ''){
        return;
      }
      List<Order> loadedOrders = [];
      extractedOrder.forEach((key, value) {
        loadedOrders.add(Order(
          orderId: key,
          amount: value['totalAmount'],
          dateTime: DateTime.parse(value['date']),
          products: (value['products'] as List<dynamic>).map((element) => CartItem(
              itemId: element['id'],
              itemTitle: element['title'],
              quantity: element['quantity'],
              price: element['price'])
          ).toList(),
        ));
        _ordersList = loadedOrders;
        notifyListeners();
      });

    }catch(error){
      throw error;
    }

    notifyListeners();
  }

  Future <void> addOrder(List<CartItem> cartProducts, double total) async {
    final url = 'https://climate-change-ec951-default-rtdb.firebaseio.com/orders/$userId.json?auth=$authToken';
    final timeStamp = DateTime.now();
    final response = await http.post(Uri.parse(url), body: json.encode({
      'totalAmount' : total,
      'date': timeStamp.toIso8601String(),
      'products' : cartProducts.map((cartProduct) => {
        'id' : cartProduct.itemId,
        'title' : cartProduct.itemTitle,
        'quantity' : cartProduct.quantity,
        'price' : cartProduct.price
      }).toList()
    }));
    _ordersList.insert(0, Order(
        orderId: json.decode(response.body)['name'],
        amount: total,
        products: cartProducts,
        dateTime: timeStamp));
    notifyListeners();
  }
}