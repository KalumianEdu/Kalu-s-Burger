import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/models/resturant.dart';
import 'package:fooddeliveryapp/theme/custom_theme.dart';

// pages
import 'package:fooddeliveryapp/pages/home_page.dart';

//auth
import 'package:fooddeliveryapp/auth/auth_wrapper.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Resturant()),
        ChangeNotifierProvider(create: (context) => CustomTheme()),
      ],

      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // dark mode set up first

  CustomTheme customModeTheme = CustomTheme();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: customModeTheme.customLightMode,
      darkTheme: customModeTheme.customDarkMode,
      themeMode: context.watch<CustomTheme>().customMode,

      home: AuthWrapper(),
      routes: {"HomePage": (context) => HomePage()},
    );
  }
}
