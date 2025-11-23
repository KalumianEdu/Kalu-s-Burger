import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePage();
}

class _ProfilePage extends State<ProfilePage> {
  final currenUser = FirebaseAuth.instance.currentUser;

  Map<String, dynamic>? currentData = {};

  Future<void> readCurrentUserInfo() async {
    try {
      // Get the document for this UID
      DocumentSnapshot<Map<String, dynamic>> doc = await FirebaseFirestore
          .instance
          .collection("users")
          .doc(currenUser!.uid)
          .get();

      if (doc.exists) {
        currentData = doc.data();
      } else {
        print('does not exist');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    readCurrentUserInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            Text('Name: ${currentData?["name"]}'),
            Text('Email: ${currentData?['email']}'),
            Text('UserID: ${currenUser!.uid.toString()}'),
          ],
        ),
      ),
    );
  }
}
