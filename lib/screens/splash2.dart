import 'package:flutter/material.dart';

class Splash2 extends StatefulWidget {
  const Splash2({super.key});

  @override
  State<Splash2> createState() => _Splash2State();
}

class _Splash2State extends State<Splash2> {
  @override
  void initState() {
    super.initState();
    // بعد 3 ثواني ننتقل للشاشة الثانية
    Future.delayed(const Duration(seconds: 3), () {
     
    });
  }

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      backgroundColor: const Color(0xFFF6E4E6),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Center(
                child: Image.asset('assets/logo.png', width: 300),
              ),
          
            const SizedBox(height: 20),
            const Text(
              'مرحباً بك',
              style: TextStyle(
                fontSize: 26,
                color: Color(0xFF5E4A4A),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
