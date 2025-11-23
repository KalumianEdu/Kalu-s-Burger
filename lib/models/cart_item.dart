// Models
import 'package:fooddeliveryapp/models/food.dart';

class CartItem {
  Food food;
  List<Addon> addonChecked;
  int quantaty;

  CartItem({
    required this.food,
    required this.addonChecked,
    required this.quantaty,
  });

  double get totalPrice {
    double addonPrice = addonChecked.fold(0, (sum, addon) => sum + addon.price);
    return (food.price + addonPrice) * quantaty;
  }

  Map<String, dynamic> toMap() {
    return {
      'name': food.title,
      'type': food.category.toString(),
      'quantity': quantaty,
      'price': food.price,
      'add-ons': addonChecked.map((addon) => addon.toMap()),
    };
  }
}
