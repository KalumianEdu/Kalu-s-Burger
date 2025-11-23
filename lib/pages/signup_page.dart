import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/components/custom_pass_form_field.dart';
import 'package:fooddeliveryapp/pages/home_page.dart';
import 'package:lottie/lottie.dart';
import 'package:firebase_auth/firebase_auth.dart';

// components
import 'package:fooddeliveryapp/components/custom_text_form_field.dart';
import 'package:fooddeliveryapp/components/custom_material_button.dart';

// Service
import 'package:fooddeliveryapp/services/firesore_service.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPage();
}

class _SignupPage extends State<SignupPage> {
  //Controllers
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();

  // Sign up in the app
  Future<void> singUp() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passController.text.trim(),
      );

      await addUser(
        nameController.text.trim(),
        emailController.text.trim(),
        passController.text.trim(),
      );

      Navigator.of(
        context,
      ).push(MaterialPageRoute(builder: (context) => HomePage()));
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }

  @override
  void dispose() {
    // Dispose controllers
    nameController.dispose();
    emailController.dispose();
    passController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Register Page")),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Welcome him
                Container(
                  margin: EdgeInsets.only(top: 40),
                  child: Lottie.asset('assets/lottie/Welcome.json'),
                ),
                SizedBox(height: 70),

                // Title Sign up
                Text(
                  'Please fill the form to register ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(height: 10),

                // Text form field for full name
                CustomTextFormField(
                  customHint: 'Name',
                  customController: nameController,
                  customLength: 25,
                  customPattern: RegExp(r'^[A-Za-z ]+'),
                ),
                SizedBox(height: 10),

                // Text form field for email name
                CustomTextFormField(
                  customHint: 'Email',
                  customController: emailController,
                  customLength: 60,
                  customPattern: RegExp(r'[a-zA-Z0-9@._\-+]'),
                ),
                SizedBox(height: 10),

                // Text form field for password
                CustomPassFormField(
                  customHint: 'Password',
                  customController: passController,
                  customLength: 20,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset(
                      'assets/lottie/fast food mobile app loading.json',
                      width: 150,
                    ),
                  ],
                ),

                // Register button
                Row(
                  children: [
                    Expanded(
                      child: CustomMaterialButton(
                        onPressed: () {
                          singUp();
                        },
                        btnTitle: "Register Now",
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
