import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/models/cart_item.dart';

import 'food.dart';

class Resturant extends ChangeNotifier {
  final List<Food> _menu = [
    //Burgers
    Food(
      title: 'The Classic All-American Cheeseburger',
      category: FoodCategory.burgers,
      price: 6,
      description:
          "A perfectly grilled beef patty with cheddar, lettuce, tomato, onion, pickles, ketchup, and mustard on a sesame bun.",
      availableAddons: [
        Addon(name: "Cheese", price: 0.5),
        Addon(name: "pickeles", price: 0.5),
      ],
      imagePath:
          'assets/images/burgers/the classic all american cheeseburger.png',
    ),
    Food(
      title: 'The Gourmet Mushroom Swiss Burger',
      category: FoodCategory.burgers,
      price: 10,
      description:
          "Juicy beef patty with sautéed mushrooms, melted Swiss cheese, and truffle aioli on a brioche bun.",
      availableAddons: [
        Addon(name: "Cheese", price: 0.5),
        Addon(name: "pickeles", price: 0.5),
      ],
      imagePath: 'assets/images/burgers/The Gourmet Mushroom Swiss Burger.png',
    ),
    Food(
      title: 'The Spicy BBQ Bacon Burger',
      category: FoodCategory.burgers,
      price: 14,
      description:
          "Fiery beef patty with smoky BBQ sauce, crispy bacon, coleslaw, and pickled jalapeños on a pretzel bun.",
      availableAddons: [
        Addon(name: "Cheese", price: 0.5),
        Addon(name: "pickeles", price: 0.5),
      ],
      imagePath: 'assets/images/burgers/The Spicy BBQ Bacon Burger.png',
    ),
    Food(
      title: 'The California Chicken Avocado Burger',
      category: FoodCategory.burgers,
      price: 13,
      description:
          "Grilled chicken breast, fresh avocado, bacon, Swiss cheese, and cilantro-lime aioli on a whole wheat bun.",
      availableAddons: [
        Addon(name: "Cheese", price: 0.5),
        Addon(name: "pickeles", price: 0.5),
      ],
      imagePath:
          'assets/images/burgers/The California Chicken Avocado Burger.png',
    ),
    Food(
      title: 'The Stacked Double Patty Melt',
      category: FoodCategory.burgers,
      price: 9,
      description:
          "Two thin beef patties, caramelized onions, Swiss and American cheese, grilled on buttered rye bread.",
      availableAddons: [
        Addon(name: "Cheese", price: 0.5),
        Addon(name: "pickeles", price: 0.5),
      ],
      imagePath: 'assets/images/burgers/The Stacked Double Patty Melt.png',
    ),
    Food(
      title: 'The Mediterranean Lamb Burger',
      category: FoodCategory.burgers,
      price: 22,
      description:
          "Seasoned lamb patty with feta, cucumber, red onion, and tzatziki sauce on a pita-style bun.",
      availableAddons: [
        Addon(name: "Cheese", price: 0.5),
        Addon(name: "pickeles", price: 0.5),
      ],
      imagePath: 'assets/images/burgers/The Mediterranean Lamb Burger.png',
    ),
    Food(
      title: 'The Hawaiian Teriyaki Burger',
      category: FoodCategory.burgers,
      price: 16,
      description:
          "Teriyaki-glazed beef patty with grilled pineapple, crispy bacon, and melted provolone on a soft bun.",
      availableAddons: [
        Addon(name: "Cheese", price: 0.5),
        Addon(name: "pickeles", price: 0.5),
      ],
      imagePath: 'assets/images/burgers/The Hawaiian Teriyaki Burger.png',
    ),
    Food(
      title: 'The Ultimate Veggie Burger',
      category: FoodCategory.burgers,
      price: 17,
      description:
          "Hearty plant-based patty, spinach, sun-dried tomatoes, roasted red peppers, and pesto aioli on a whole-grain bun.",
      availableAddons: [
        Addon(name: "Cheese", price: 0.5),
        Addon(name: "pickeles", price: 0.5),
      ],
      imagePath: 'assets/images/burgers/The Ultimate Veggie Burger.png',
    ),
    Food(
      title: 'The Breakfast Burger',
      category: FoodCategory.burgers,
      price: 8,
      description:
          "Beef patty topped with a fried egg, crispy bacon, and melted American cheese on a toasted English muffin.",
      availableAddons: [
        Addon(name: "Cheese", price: 0.5),
        Addon(name: "pickeles", price: 0.5),
      ],
      imagePath: 'assets/images/burgers/The Breakfast Burger.png',
    ),

    // Salads
    Food(
      title: 'Mediterranean Grain Bowl',
      category: FoodCategory.salads,
      price: 4,
      description:
          "A hearty, satisfying salad built on a bed of fluffy quinoa, layered with chopped cucumber, cherry tomatoes, Kalamata olives, finely diced red onion, fresh parsley, and cubes of salty Feta cheese, dressed with a bright Lemon-Oregano Vinaigrette.",
      availableAddons: [
        Addon(name: "Slicing Chicken", price: 2.0),
        Addon(name: "Pickeles", price: 0.5),
        Addon(name: "Custom Souce", price: 0.5),
      ],
      imagePath: 'assets/images/salads/Mediterranean Grain Bowl.png',
    ),
    Food(
      title: 'Southwest Black Bean & Corn Salad',
      category: FoodCategory.salads,
      price: 5.0,
      description:
          "A zesty, refreshing combination of black beans, sweet corn, diced bell peppers, red onion, cilantro, and a creamy, smoky Chipotle-Lime Dressing, often served with crispy tortilla strips on the side.",
      availableAddons: [
        Addon(name: "Slicing Chicken", price: 2.0),
        Addon(name: "Pickeles", price: 0.5),
        Addon(name: "Custom Souce", price: 0.5),
      ],
      imagePath: 'assets/images/salads/Southwest Black Bean & Corn Salad.png',
    ),
    Food(
      title: 'Spicy Thai Beef Salad (Yum Neua)',
      category: FoodCategory.salads,
      price: 10.0,
      description:
          "Tender strips of grilled marinated flank steak served over a bed of crisp mixed greens, tossed with shredded carrot, bell peppers, mint, cilantro, and a fiery dressing made with lime juice, chili, and fish sauce.",
      availableAddons: [
        Addon(name: "Slicing Chicken", price: 2.0),
        Addon(name: "Pickeles", price: 0.5),
        Addon(name: "Custom Souce", price: 0.5),
      ],
      imagePath: 'assets/images/salads/Spicy Thai Beef Salad (Yum Neua).png',
    ),
    Food(
      title: 'The Harvest Pecan & Goat Cheese Salad',
      category: FoodCategory.salads,
      price: 4,
      description:
          "A vibrant mix of baby kale and mixed greens, tossed with toasted maple pecans, creamy crumbled goat cheese, sliced Granny Smith apples, dried cranberries, and finished with a house-made Honey-Dijon Vinaigrette.",
      availableAddons: [
        Addon(name: "Slicing Chicken", price: 2.0),
        Addon(name: "Pickeles", price: 0.5),
        Addon(name: "Custom Souce", price: 0.5),
      ],
      imagePath:
          'assets/images/salads/The Harvest Pecan & Goat Cheese Salad.png',
    ),
    Food(
      title: 'The Simple Green Garden Salad',
      category: FoodCategory.salads,
      price: 3,
      description:
          "A fresh, simple side salad featuring a blend of spring mix and butter lettuce, cherry tomatoes, sliced cucumbers, shredded carrots, and a light, herbaceous House Vinaigrette. Perfect for pairing with any burger!",
      availableAddons: [
        Addon(name: "Slicing Chicken", price: 2.0),
        Addon(name: "Pickeles", price: 0.5),
        Addon(name: "Custom Souce", price: 0.5),
      ],
      imagePath: 'assets/images/salads/The Simple Green Garden Salad.png',
    ),

    // Sides
    Food(
      title: 'Classic Crispy Fries',
      category: FoodCategory.sides,
      price: 3.99,
      description:
          "Golden, perfectly salted, and incredibly crispy, our classic fries are the ultimate burger companion.",
      availableAddons: [],
      imagePath: 'assets/images/sides/Classic Crispy Fries.png',
    ),
    Food(
      title: 'Coleslaw',
      category: FoodCategory.sides,
      price: 3.50,
      description:
          "A refreshing and crunchy mix of shredded cabbage and carrots in a tangy, creamy dressing. A perfect palate cleanser.",
      availableAddons: [],
      imagePath: 'assets/images/sides/Coleslaw.png',
    ),
    Food(
      title: 'Corn on the Cob',
      category: FoodCategory.sides,
      price: 4.0,
      description:
          "Sweet and juicy corn on the cob, grilled and served with a pat of butter. A simple, classic side.",
      availableAddons: [],
      imagePath: 'assets/images/sides/Corn on the Cob.png',
    ),
    Food(
      title: 'Garlic Parmesan Truffle Fries',
      category: FoodCategory.sides,
      price: 6.5,
      description:
          "Our crispy fries tossed with aromatic garlic, grated Parmesan cheese, and a hint of luxurious truffle oil.",
      availableAddons: [],
      imagePath: 'assets/images/sides/Garlic Parmesan Truffle Fries.png',
    ),
    Food(
      title: 'Loaded Chili Cheese Fries',
      category: FoodCategory.sides,
      price: 7.99,
      description:
          "A generous portion of our classic fries smothered in hearty beef chili and melted cheddar cheese.",
      availableAddons: [],
      imagePath: 'assets/images/sides/Loaded Chili Cheese Fries.png',
    ),
    Food(
      title: 'Mac & Cheese Bites',
      category: FoodCategory.sides,
      price: 5.99,
      description:
          "Creamy macaroni and cheese, breaded and fried until golden, perfect for a cheesy, bite-sized indulgence.",
      availableAddons: [],
      imagePath: 'assets/images/sides/Mac & Cheese Bites.png',
    ),
    Food(
      title: 'MOnion Rings',
      category: FoodCategory.sides,
      price: 4.5,
      description:
          "Thick-cut onion rings, battered and fried to a golden perfection, offering a satisfying crunch with every bite.",
      availableAddons: [],
      imagePath: 'assets/images/sides/Onion Rings.png',
    ),
    Food(
      title: 'Side Salad',
      category: FoodCategory.sides,
      price: 4.99,
      description:
          "Fresh mixed greens with cherry tomatoes, cucumber, and your choice of dressing. A lighter, healthier option.",
      availableAddons: [],
      imagePath: 'assets/images/sides/Side Salad.png',
    ),
    Food(
      title: 'Sweet Potato Fries',
      category: FoodCategory.sides,
      price: 4.99,
      description:
          "A delicious and slightly sweeter alternative to traditional fries, served with a side of maple aioli.",
      availableAddons: [],
      imagePath: 'assets/images/sides/Sweet Potato Fries.png',
    ),

    // Deserts
    Food(
      title: 'Apple Crumble with Custard',
      category: FoodCategory.deserts,
      price: 6.75,
      description:
          "Sweet and tart baked apples topped with a buttery, crisp oat crumble, served warm with a generous pour of creamy vanilla custard.",
      availableAddons: [],
      imagePath: 'assets/images/desserts/Apple Crumble with Custard.png',
    ),
    Food(
      title: 'Classic Cheesecake',
      category: FoodCategory.deserts,
      price: 6.99,
      description:
          "A rich, creamy New York-style cheesecake with a graham cracker crust, often served with a choice of fruit topping (strawberry, cherry, or blueberry).",
      availableAddons: [],
      imagePath: 'assets/images/desserts/Classic Cheesecake.png',
    ),
    Food(
      title: 'Crème Brûlée',
      category: FoodCategory.deserts,
      price: 6.5,
      description:
          "A silky smooth vanilla bean custard topped with a brittle layer of caramelized sugar.",
      availableAddons: [],
      imagePath: 'assets/images/desserts/Crème Brûlée.png',
    ),
    Food(
      title: 'Key Lime Pie',
      category: FoodCategory.deserts,
      price: 6.99,
      description:
          "A tangy and sweet pie made with fresh key lime juice, a graham cracker crust, and often topped with whipped cream.",
      availableAddons: [],
      imagePath: 'assets/images/desserts/Key Lime Pie.png',
    ),
    Food(
      title: 'Molten Chocolate Lava Cake',
      category: FoodCategory.deserts,
      price: 7.5,
      description:
          "A warm, decadent chocolate cake with a gooey, molten chocolate center, typically served with a scoop of vanilla bean ice cream.",
      availableAddons: [],
      imagePath: 'assets/images/desserts/Molten Chocolate Lava Cake.png',
    ),
    Food(
      title: 'Tiramisu',
      category: FoodCategory.deserts,
      price: 7.25,
      description:
          "A classic Italian dessert made with layers of coffee-soaked ladyfingers, mascarpone cheese, and cocoa powder.",
      availableAddons: [],
      imagePath: 'assets/images/desserts/Tiramisu.png',
    ),

    // Drinks
    Food(
      title: 'Berry Blast Smoothie',
      category: FoodCategory.drinks,
      price: 7.25,
      description: "",
      availableAddons: [],
      imagePath: 'assets/images/drinks/Berry Blast Smoothie.png',
    ),
    Food(
      title: 'Classic Cola Chill',
      category: FoodCategory.drinks,
      price: 3,
      description: "",
      availableAddons: [],
      imagePath: 'assets/images/drinks/Classic Cola Chill.png',
    ),
    Food(
      title: 'Mirinda Orange Fizz',
      category: FoodCategory.drinks,
      price: 2.75,
      description: "",
      availableAddons: [],
      imagePath: 'assets/images/drinks/Mirinda Orange Fizz.png',
    ),
    Food(
      title: 'Ocean Breeze',
      category: FoodCategory.drinks,
      price: 8.50,
      description: "",
      availableAddons: [],
      imagePath: 'assets/images/drinks/Ocean Breeze.png',
    ),
    Food(
      title: 'Pepsi Max Delight',
      category: FoodCategory.drinks,
      price: 7.25,
      description: "",
      availableAddons: [],
      imagePath: 'assets/images/drinks/Pepsi Max Delight.png',
    ),
    Food(
      title: 'Sparkling Sprite Splash',
      category: FoodCategory.drinks,
      price: 2.25,
      description: "",
      availableAddons: [],
      imagePath: 'assets/images/drinks/Sparkling Sprite Splash.png',
    ),
    Food(
      title: 'Tropical Sunset',
      category: FoodCategory.drinks,
      price: 9,
      description: "",
      availableAddons: [],
      imagePath: 'assets/images/drinks/Tropical Sunset.png',
    ),
    Food(
      title: 'Classic Hot Tea',
      category: FoodCategory.drinks,
      price: 2.25,
      description: "",
      availableAddons: [],
      imagePath: 'assets/images/drinks/Classic Hot Tea.png',
    ),
  ];

  /* 
    GETTERS
  */

  List<Food> get menu => _menu;

  /* 
    OPERARTIONS
  */

  // User cart
  final List<CartItem> _cart = [];

  List<CartItem> get cart => _cart;

  // add to cart
  void addToCart(Food food, List<Addon> checkedAddons) {
    // see if there is a cart item already with the same food and selected addons
    CartItem? cartItme = _cart.firstWhereOrNull((item) {
      // Check if the food item are the same
      bool isSameFood = item.food == food;

      // check if the list of selected addons are the same
      bool isAddonSame = ListEquality().equals(
        item.addonChecked,
        checkedAddons,
      );

      return isSameFood && isAddonSame;
    });

    // if item exists increase quantaty
    if (cartItme != null) {
      cartItme.quantaty += 1;
    }
    // Otherwise , add a new cart item
    else {
      _cart.add(CartItem(food: food, addonChecked: checkedAddons, quantaty: 1));
    }
    notifyListeners();
  }

  // remove from cart
  void removeFromCart(CartItem cartItem) {
    int cartIndex = _cart.indexOf(cartItem);

    if (cartIndex != -1) {}
    if (_cart[cartIndex].quantaty > 1) {
      _cart[cartIndex].quantaty--;
    } else {
      _cart.removeAt(cartIndex);
    }

    notifyListeners();
  }

  // Remove some quantaty
  void remvoeQuantaty(CartItem cartItem) {
    cartItem.quantaty--;
    notifyListeners();
  }

  // get total price
  double getTotalPrice() {
    double totalPrice = 0.0;
    for (CartItem cartItem in _cart) {
      double itemTotal = cartItem.food.price;

      for (Addon addon in cartItem.addonChecked) {
        itemTotal += addon.price;
      }
      totalPrice += itemTotal * cartItem.quantaty;
    }
    return totalPrice;
  }

  // get total number of items in cart
  int getTotalItemCount() {
    int totalItemCount = 0;

    for (CartItem cartItem in _cart) {
      totalItemCount += cartItem.quantaty;
    }
    return totalItemCount;
  }

  // clear cart
  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  /*
    HELPERS
  */

  // genereate bill

  // format double value into money

  // format a list addon into a string summry
}
