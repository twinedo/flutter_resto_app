import 'package:flutter/material.dart';
import 'package:restaurant_app_sub1/pages/home_page.dart';
import 'package:restaurant_app_sub1/pages/splash_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CaResto',
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => SplashPage(),
        '/home': (context) => HomePage()
      },
    );
  }
}
