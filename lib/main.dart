import 'package:flutter/material.dart';
import 'package:flutter_pokemon_gql/common/theme.dart';
import 'package:flutter_pokemon_gql/features/detail_screen/view/detail_page.dart';
import 'package:flutter_pokemon_gql/features/main_screen/view/main_screen.dart';

import 'features/splash_screen/view/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokemon',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const SplashScreen(),
        '/main-page': (context) => const MainPage(),
        '/detail-page': (context) => const DetailPage(),
      },
    );
  }
}
