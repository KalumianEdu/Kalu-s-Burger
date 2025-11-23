//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// pages
import 'package:fooddeliveryapp/pages/food_page.dart';

// components
import 'package:fooddeliveryapp/components/custom_drawer.dart';
import 'package:fooddeliveryapp/components/custom_tab_bar.dart';
import 'package:fooddeliveryapp/components/my_current_location.dart';
import 'package:fooddeliveryapp/components/my_sliver_appbar.dart';
import 'package:fooddeliveryapp/models/food.dart';
import 'package:fooddeliveryapp/models/resturant.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> with SingleTickerProviderStateMixin {
  // Controller
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(
      length: FoodCategory.values.length,
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  // Sort out and return a list of food item that belogns to spcefic category
  List<Food> _filterMenuByCategory(FoodCategory category, List<Food> fulName) {
    return fulName.where((food) => food.category == category).toList();
  }

  // retrun a list of food by given category
  List<Widget> getFoodInThisCategory(List<Food> fulName) {
    return FoodCategory.values.map((category) {
      List<Food> categoryMenu = _filterMenuByCategory(category, fulName);
      return ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: categoryMenu.length,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => FoodPage(food: categoryMenu[index]),
                  ),
                );
              },
              child: Row(
                children: [
                  Flexible(
                    child: ListTile(
                      title: Text(
                        categoryMenu[index].title,
                        style: TextStyle(fontSize: 14),
                      ),
                      subtitle: Text(
                        "\$${categoryMenu[index].price}",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Theme.of(context).colorScheme.surface,
                          blurRadius: 12,
                        ),
                      ],

                      borderRadius: BorderRadius.circular(12),
                    ),
                    height: 100,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        categoryMenu[index].imagePath,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          MySliverAppBar(
            title: CustomTabBar(customController: tabController),
            child: Container(
              margin: EdgeInsets.only(bottom: 20),
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Divider(indent: 0, endIndent: 0, color: Colors.white),

                    // my current location
                    SizedBox(height: 10),
                    MyCurrentLocation(),

                    // description box
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      padding: EdgeInsets.all(30),
                      height: 100,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary,
                        borderRadius: BorderRadius.circular(12),
                        //border: Border.all(color: Colors.black),
                        boxShadow: [
                          BoxShadow(
                            color: Theme.of(context).colorScheme.primary,
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // first column Dilvery fee
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // price
                              Text("\$1.50"),
                              //title
                              Text("Delivery Fee"),
                            ],
                          ),
                          // second column Dilevery time
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // duration
                              Text("15 - 30 min"),
                              //title
                              Text("Delivery Time"),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
        body: Consumer<Resturant>(
          builder: (context, resturant, child) => TabBarView(
            controller: tabController,
            children: getFoodInThisCategory(resturant.menu),
          ),
        ),
      ),
    );
  }
}
