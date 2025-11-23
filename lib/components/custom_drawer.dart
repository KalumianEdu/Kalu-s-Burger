import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fooddeliveryapp/auth/auth_wrapper.dart';

//pages
import 'package:fooddeliveryapp/pages/home_page.dart';
import 'package:fooddeliveryapp/pages/profile_page.dart';
import 'package:fooddeliveryapp/pages/login_page.dart';
import 'package:fooddeliveryapp/pages/setting_page.dart';
import 'package:fooddeliveryapp/pages/fill_card_page.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.primary,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  // let you go to Home page
                  ListTile(
                    title: GestureDetector(
                      onTap: () {
                        final route = ModalRoute.of(context);
                        if (route != null) {
                          final routeName = route.settings.name;
                          print("current screen: $routeName");
                        } else {
                          print("Cannot determine current screen");
                        }
                      },
                      child: Text('Home '),
                    ),
                    leading: Icon(Icons.home),
                  ),
                  ListTile(
                    title: Text('Profile'),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => ProfilePage()),
                      );
                    },
                    leading: Icon(Icons.person),
                  ),
                  ListTile(
                    title: Text("Settings"),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => SettingPage()),
                      );
                    },
                    leading: Icon(Icons.settings),
                  ),
                ],
              ),
              ListTile(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                onTap: () async {
                  await FirebaseAuth.instance.signOut();

                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => AuthWrapper()),
                    (route) => false,
                  );
                },
                title: Text('Logout'),
                trailing: Icon(Icons.logout),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
