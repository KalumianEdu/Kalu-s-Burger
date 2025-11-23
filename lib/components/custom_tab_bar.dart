import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/models/food.dart';

class CustomTabBar extends StatelessWidget {
  final TabController customController;
  CustomTabBar({super.key, required this.customController});

  List<Tab> _buildCategoryTabs() {
    return FoodCategory.values.map((category) {
      return Tab(text: category.toString().split('.').last);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Theme.of(context).colorScheme.secondary),

      child: TabBar(
        isScrollable: true,
        controller: customController,
        tabs: _buildCategoryTabs(),
        labelColor: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}
