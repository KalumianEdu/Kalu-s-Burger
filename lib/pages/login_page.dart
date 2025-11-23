import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/components/custom_pass_form_field.dart';
import 'package:lottie/lottie.dart';

// pages
import 'package:fooddeliveryapp/pages/signup_page.dart';
import 'package:fooddeliveryapp/pages/home_page.dart';

//componnets
import 'package:fooddeliveryapp/components/custom_material_button.dart';
import 'package:fooddeliveryapp/components/custom_text_form_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  // Controllers
  final emailController = TextEditingController();
  final passController = TextEditingController();

  // Login into Home page
  Future<void> logIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }

  @override
  void dispose() {
    //Dispose Controller
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 230,
                  child: Lottie.asset(
                    'assets/lottie/Bouncing Burger.json',
                    width: 300,
                  ),
                ),

                // title
                Container(
                  margin: EdgeInsets.only(bottom: 30, top: 20),
                  child: Text(
                    "KALU'S BURGER",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                ),
                // email text form field
                SizedBox(
                  height: 50,
                  child: CustomTextFormField(
                    customHint: 'Email',
                    customController: emailController,
                    customLength: 60,
                    customPattern: RegExp(r'[a-zA-Z0-9@._\-+]'),
                  ),
                ),

                SizedBox(height: 10),
                // password text from field
                SizedBox(
                  height: 50,
                  child: CustomPassFormField(
                    customHint: 'Password',
                    customController: passController,
                    customLength: 20,
                  ),
                ),

                SizedBox(height: 10),
                // Login button
                Row(
                  children: [
                    Expanded(
                      child: CustomMaterialButton(
                        onPressed: () {
                          logIn();
                        },
                        btnTitle: "Login",
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 30),
                //  not registred
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Not a member? '),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          PageRouteBuilder(
                            transitionDuration: Duration(seconds: 1),
                            pageBuilder:
                                (context, animation, secondaryAnimation) =>
                                    SignupPage(),
                            transitionsBuilder:
                                (
                                  context,
                                  animation,
                                  secondaryAnimation,
                                  child,
                                ) {
                                  final tween = Tween(
                                    begin: Offset(1.0, 0.0),
                                    end: Offset.zero,
                                  );
                                  final curvedAnimation = CurvedAnimation(
                                    parent: animation,
                                    curve: Curves.easeInOut,
                                  );

                                  return SlideTransition(
                                    position: tween.animate(curvedAnimation),
                                    child: child,
                                  );
                                },
                          ),
                        );
                      },
                      child: Text(
                        'Register now',
                        style: TextStyle(fontWeight: FontWeight.bold),
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
