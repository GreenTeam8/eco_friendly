import 'package:flutter/foundation.dart';


import '../model/cart_item.dart';

class CartController with ChangeNotifier{


  ///key here is the productId
  Map <String, CartItem> _items = {};


  /// to get the map (_items) and manipulate it
  Map<String, CartItem> get items{
    return {..._items};
  }

  int get itemCount{

    return items.length;
  }

  double get totalAmount{
    double total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  void addItem(String productId, double price, String title, String image){
    if(_items.containsKey(productId)){
      _items.update(productId, (existingCartItem) => CartItem(
          itemId: existingCartItem.itemId,
          itemTitle: existingCartItem.itemTitle,
          price: existingCartItem.price,
          itemImage: existingCartItem.itemImage,
          quantity: existingCartItem.quantity +1,

      ));
    }else{
      _items.putIfAbsent(productId, () => CartItem(
          itemId: DateTime.now().toString(), itemTitle: title, quantity: 1, price: price, itemImage: image));
    }
    notifyListeners();
  }

  void removeItem(String ProductId){
    _items.remove(ProductId);
    notifyListeners();
  }

  void removeSingleItem(String productId){
    if(!_items.containsKey(productId)){
      return;
    }if(_items[productId]!.quantity > 1 ){
      _items.update(productId, (existingCartItem) => CartItem(
          itemId: existingCartItem.itemId,
          itemTitle: existingCartItem.itemTitle,
          quantity: existingCartItem.quantity -1,
          price: existingCartItem.price,
        itemImage: existingCartItem.itemImage

      ));
    }else{
      _items.remove(productId);
    }
    notifyListeners();
  }

  void clearCart(){
    _items ={};
    notifyListeners();
  }

}