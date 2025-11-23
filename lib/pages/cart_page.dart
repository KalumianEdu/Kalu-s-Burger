import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/components/custom_material_button.dart';
import 'package:fooddeliveryapp/models/resturant.dart';
import 'package:fooddeliveryapp/pages/payment_page.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  CartPage({super.key});

  @override
  State<CartPage> createState() => _CartState();
}

class _CartState extends State<CartPage> {
  Icon removeIcon = Icon(Icons.remove);
  Icon deleteIcon = Icon(Icons.delete);
  void initSate() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        actions: [
          IconButton(
            icon: Icon(Icons.delete_forever),
            onPressed: () {
              context.read<Resturant>().clearCart();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: context.watch<Resturant>().cart.length,
                itemBuilder: (context, index) {
                  final cartItem = context.read<Resturant>().cart[index];
                  return Container(
                    margin: EdgeInsets.only(
                      bottom: 15,
                      top: 10,
                      left: 10,
                      right: 10,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Theme.of(context).colorScheme.secondary,
                    ),

                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // For the image and the title also adding new
                        ListTile(
                          tileColor: Colors.black,
                          contentPadding: EdgeInsets.all(0),
                          minTileHeight: 80,

                          leading: ClipRRect(
                            borderRadius: BorderRadiusGeometry.circular(8),
                            child: Image.asset(
                              context
                                  .read<Resturant>()
                                  .cart[index]
                                  .food
                                  .imagePath,
                            ),
                          ),
                          title: Text(
                            context.read<Resturant>().cart[index].food.title,
                          ),
                          subtitle: Text(
                            "\$${context.read<Resturant>().cart[index].food.price.toStringAsFixed(2)}",
                          ),
                          trailing: Container(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.grey[800],
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  IconButton(
                                    icon: cartItem.quantaty == 1
                                        ? deleteIcon
                                        : removeIcon,
                                    onPressed: () {
                                      if (cartItem.quantaty == 1) {
                                        context
                                            .read<Resturant>()
                                            .removeFromCart(cartItem);
                                      } else {
                                        context
                                            .read<Resturant>()
                                            .remvoeQuantaty(cartItem);
                                      }
                                      //setState(() {});
                                    },
                                  ),
                                  Text(
                                    context
                                        .read<Resturant>()
                                        .cart[index]
                                        .quantaty
                                        .toString(),
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.add),
                                    onPressed: () {
                                      context.read<Resturant>().addToCart(
                                        context
                                            .read<Resturant>()
                                            .cart[index]
                                            .food,
                                        context
                                            .read<Resturant>()
                                            .cart[index]
                                            .addonChecked,
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: 25,

                                child: ListView.builder(
                                  shrinkWrap: true,

                                  scrollDirection: Axis.horizontal,
                                  itemCount: context
                                      .read<Resturant>()
                                      .cart[index]
                                      .addonChecked
                                      .length,
                                  itemBuilder: (context, secondIndex) {
                                    return Container(
                                      margin: EdgeInsets.only(right: 5),
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        child: Text(
                                          " ${context.read<Resturant>().cart[index].addonChecked[secondIndex].name} (\$${context.read<Resturant>().cart[index].addonChecked[secondIndex].price})",
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomMaterialButton(
                      btnTitle:
                          'Go to checkout \$${context.read<Resturant>().getTotalPrice()}',
                      onPressed: () {
                        if (context.read<Resturant>().getTotalItemCount() !=
                            0) {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => PaymentPage(),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
