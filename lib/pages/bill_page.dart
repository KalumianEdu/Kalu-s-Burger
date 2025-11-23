import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/models/bill.dart';
import 'package:fooddeliveryapp/models/cart_item.dart';
import 'package:fooddeliveryapp/models/resturant.dart';
import 'package:lottie/lottie.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

// firestore
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class BillPage extends StatefulWidget {
  const BillPage({super.key});

  @override
  State<BillPage> createState() => _BillPage();
}

class _BillPage extends State<BillPage> {
  late String orderDate;

  void addFoodOrderToFirestore() {
    final userID = FirebaseAuth.instance.currentUser;
    final totalPrice = context.read<Resturant>().getTotalPrice();
    final List<CartItem> cartItems = context.read<Resturant>().cart;

    Bill bill = Bill(
      userID: userID!.uid,
      date: orderDate,
      total: totalPrice,
      cartItems: cartItems,
    );
    FirebaseFirestore.instance.collection('orders').add(bill.toMap());
  }

  @override
  void initState() {
    orderDate = DateFormat('yyyy-MM-dd HH:mm').format(DateTime.now());
    addFoodOrderToFirestore();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                  width: 100,
                  child: Lottie.asset('assets/lottie/Delivery Riding.json'),
                ),

                Text("Thank you for your order!"),
              ],
            ),
          ),

          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            margin: EdgeInsets.only(bottom: 20, top: 100, left: 25, right: 25),
            padding: EdgeInsets.all(25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Here\' your receipt.'),
                Text(' $orderDate'),
                Text('--------------------------'),
                Text('Food list :'),
                ListView.builder(
                  shrinkWrap: true,

                  itemCount: context.read<Resturant>().cart.length,
                  itemBuilder: (context, index) {
                    final cartIndex = context.read<Resturant>().cart[index];
                    return ListTile(
                      title: Text(
                        "${cartIndex.quantaty} x ${cartIndex.food.title} - \$${cartIndex.food.price} \nAdd-ons:",
                      ),
                      subtitle: Column(
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: cartIndex.addonChecked.length,
                            itemBuilder: (context, index2) {
                              final cartIndexIndex2 =
                                  cartIndex.addonChecked[index2];
                              return Container(
                                margin: EdgeInsets.only(left: 15),
                                child: Text(
                                  "${cartIndexIndex2.name} (\$${cartIndexIndex2.price})",
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),

                Text("---------------------------"),
                // Total price
                Text(
                  "Total price: \$${context.read<Resturant>().getTotalPrice().toStringAsFixed(2)}",
                ),
              ],
            ),
          ),
        ],
      ),

      // bottom container
      bottomNavigationBar: BottomAppBar(
        color: Colors.grey[800],
        child: ListTile(
          leading: Icon(Icons.person),
          title: Text("Kalumian Abdurrakhman"),
          subtitle: Text("Driver"),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.chat)),
              IconButton(
                onPressed: () {
                  callNumber("05451231292");
                },
                icon: Icon(Icons.phone, color: Colors.green),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void callNumber(String number) async {
    final Uri url = Uri(scheme: 'tel', path: number);

    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      print("Cannot launch phone app");
    }
  }
}
