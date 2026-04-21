import 'package:flutter/material.dart';
import 'package:foodgo/splash.dart';

void main() {
  runApp(const FoodGo());
}

class FoodGo extends StatelessWidget {
  const FoodGo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Splash());
  }
}
