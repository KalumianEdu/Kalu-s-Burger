import 'package:flutter/material.dart';

// Model
import 'package:fooddeliveryapp/models/food.dart';

// component
import 'package:fooddeliveryapp/components/custom_material_button.dart';
import 'package:fooddeliveryapp/models/resturant.dart';
import 'package:provider/provider.dart';

class FoodPage extends StatefulWidget {
  final Food food;
  final Map<Addon, bool> selectedAddoos = {};
  FoodPage({super.key, required this.food}) {
    // initialze selected addons to be false
    for (Addon addon in food.availableAddons) {
      selectedAddoos[addon] = false;
    }
  }

  @override
  State<FoodPage> createState() => _FoodPage();
}

class _FoodPage extends State<FoodPage> {
  // method to add to cart
  void addToCart(Food food, Map<Addon, bool> selectedAddons) {
    List<Addon> currentlySelectedAddons = [];
    for (Addon addon in widget.food.availableAddons) {
      if (widget.selectedAddoos[addon] == true) {
        currentlySelectedAddons.add(addon);
      }
    }

    context.read<Resturant>().addToCart(food, currentlySelectedAddons);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                // back button

                // food image
                Image.asset(widget.food.imagePath),

                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // food name + price
                      ListTile(
                        contentPadding: EdgeInsets.all(0),
                        title: Text(widget.food.title),
                        subtitle: Text(
                          "\$${widget.food.price}",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                            fontWeight: FontWeight.w100,
                          ),
                        ),
                      ),

                      // food description
                      ListTile(
                        contentPadding: EdgeInsets.all(0),
                        subtitle: Text("${widget.food.description}"),
                      ),
                      SizedBox(height: 10),

                      // food add-ons
                      // title add ons
                      Text("Add-ons", style: TextStyle(fontSize: 15)),
                      SizedBox(height: 10),
                      // add-ons list
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1.2,
                            style: BorderStyle.solid,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                        ),
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: widget.food.availableAddons.length,
                          itemBuilder: (context, index) {
                            // Get individual addon
                            Addon addon = widget.food.availableAddons[index];
                            return ListTile(
                              contentPadding: EdgeInsets.all(0),
                              title: Text(
                                widget.food.availableAddons[index].name
                                    .toString(),
                              ),
                              subtitle: Text(
                                "+\$${widget.food.availableAddons[index].price}",
                                style: TextStyle(
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.secondary,
                                ),
                              ),
                              trailing: Checkbox(
                                value: widget.selectedAddoos[addon],

                                onChanged: (bool? value) {
                                  setState(() {
                                    widget.selectedAddoos[addon] = value!;
                                  });
                                },
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 20),

                      // Add to Cart button
                      Row(
                        children: [
                          Expanded(
                            child: CustomMaterialButton(
                              btnTitle: "Add to Cart",
                              onPressed: () {
                                addToCart(widget.food, widget.selectedAddoos);
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

        // Back Button
        Container(
          child: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
      ],
    );
  }
}
