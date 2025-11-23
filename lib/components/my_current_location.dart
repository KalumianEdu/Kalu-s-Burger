import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/components/custom_text_form_field.dart';

class MyCurrentLocation extends StatefulWidget {
  MyCurrentLocation({super.key});

  @override
  State<MyCurrentLocation> createState() => _MyCurrentLocation();
}

class _MyCurrentLocation extends State<MyCurrentLocation> {
  String address = 'Hisar cd. Altindag/Ankara';
  final customController = TextEditingController();

  void openLocationSearchBox(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Theme.of(context).colorScheme.onSecondary,
        title: Text('Your Location '),
        content: CustomTextFormField(
          customHint: 'Search address..',
          customController: customController,
          customLength: 200,
          customPattern: RegExp(r'^[A-Za-z /0-9]+'),
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () {
              if (customController.text != '' ||
                  customController.text.isNotEmpty) {
                address = customController.text.trim();

                setState(() {});
              }
            },
            child: Text("Change"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Deliver now"),
          GestureDetector(
            onTap: () {
              openLocationSearchBox(context);
            },
            child: Row(
              children: [
                // address
                Text(address),
                // drop down menu
                Icon(Icons.keyboard_arrow_down_rounded),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
