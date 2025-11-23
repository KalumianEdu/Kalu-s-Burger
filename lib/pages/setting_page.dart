import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:fooddeliveryapp/theme/custom_theme.dart';
import 'package:provider/provider.dart';

class SettingPage extends StatefulWidget {
  SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPage();
}

class _SettingPage extends State<SettingPage> {
  CustomTheme mode = CustomTheme();

  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Settings")),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Theme.of(context).colorScheme.secondary,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Dark Mode"),
                  CupertinoSwitch(
                    value: isChecked,
                    onChanged: (value) {
                      if (value) {
                        isChecked = true;
                      } else {
                        isChecked = false;
                      }
                      context.read<CustomTheme>().changeMode();
                      setState(() {});
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
