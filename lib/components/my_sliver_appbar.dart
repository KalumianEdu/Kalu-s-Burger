import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/pages/cart_page.dart';

class MySliverAppBar extends StatelessWidget {
  final Widget child;
  final Widget title;
  const MySliverAppBar({super.key, required this.child, required this.title});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 340,
      collapsedHeight: 120,

      floating: true,
      pinned: true,
      backgroundColor: Theme.of(context).colorScheme.primary,
      actions: [
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CartPage()),
            );
          },
          icon: Icon(Icons.shopping_cart),
        ),
      ],
      title: Text("KALU'S BURGER"),
      centerTitle: true,

      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          margin: const EdgeInsets.only(bottom: 40),
          child: child,
        ),
        title: title,
        centerTitle: true,
        titlePadding: EdgeInsets.all(0),
        expandedTitleScale: 1,
      ),
    );
  }
}
