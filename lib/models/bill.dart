import 'package:fooddeliveryapp/models/cart_item.dart';

class Bill {
  String userID;
  double total;
  String date;
  List<CartItem> cartItems;

  Bill({
    required this.userID,
    required this.total,
    required this.date,
    required this.cartItems,
  });

  Map<String, dynamic> toMap() {
    return {
      "userID": userID,
      "total": total,
      "date": date,
      "orderItems": cartItems
          .map((singleCartItem) => singleCartItem.toMap())
          .toList(),
    };
  }
}
