import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

//pages
import 'package:fooddeliveryapp/pages/login_page.dart';
import 'package:fooddeliveryapp/pages/home_page.dart';

class AuthWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(body: Center(child: CircularProgressIndicator()));
        }

        if (snapshot.hasData) {
          // User is signed in
          return HomePage();
        } else {
          // User is NOT signed in
          return LoginPage();
        }
      },
    );
  }
}
