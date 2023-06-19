class CartItem{
  ///every cart item is a new object which not holds information about the product only
  ///but also information about quantity for example
  final String itemId;
  final String itemTitle;
  final int quantity;
  final double price;
  //final String? itemImage;

  CartItem({
    required this.itemId,
    required this.itemTitle,
    required this.quantity,
    required this.price,
     //this.itemImage,
  });
}