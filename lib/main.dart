import 'package:flutter/material.dart';
import 'package:food_delivery/pages/bottom_navbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Foodak - Food Delivery',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        ),
      home: const BottomNavBar(),
    );
  }
}