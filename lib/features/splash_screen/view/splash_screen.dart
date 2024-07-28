import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushNamedAndRemoveUntil(context, '/main-page', (route) => false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
      body: Center(
          child:SizedBox(
            height: 200,
            width: 400,
            child: Image.asset(
              'assets/pokemon-logo.png',
            ),
          ),
        
      ),
    );
  }
}
