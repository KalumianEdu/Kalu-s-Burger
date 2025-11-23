import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> addUser(String name, String email, String pass) async {
  try {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    final currentUser = FirebaseAuth.instance.currentUser;

    await users.doc(currentUser!.uid).set(({
      'name': name,
      'email': email,
      'pass': pass,
    }));

    print('added successfully in the FireStore');
  } catch (e) {
    throw Exception(e);
  }
}
