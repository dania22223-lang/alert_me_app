
import 'package:alert_me_app/screens/splash1.dart';
import 'package:flutter/material.dart';

void main() async {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash1(),
    );
  }
}
