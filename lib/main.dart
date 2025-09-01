import 'package:flutter/material.dart';
import 'package:wandar_log/pages/login_page.dart';
import 'package:wandar_log/pages/signup_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wander Log',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: "login",
      routes: {
        "login": (context) => LoginPage(),
        "register": (context) => SignUpPage(),
      },
    );
  }
}
