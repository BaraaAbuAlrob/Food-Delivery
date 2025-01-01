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
        // useMaterial3: true,
        // colorSchemeSeed: Colors.deepOrange,
        primarySwatch: Colors.deepOrange,
        primaryColor: Colors.deepOrange,
        fontFamily: 'Times New Roman',
        appBarTheme: AppBarTheme(
          foregroundColor: Colors.black,
          backgroundColor: Colors.grey[100],
        ),
        listTileTheme: const ListTileThemeData(
          iconColor: Colors.deepOrange,
        ),
        dividerTheme: const DividerThemeData(
          indent: 16.0,
          endIndent: 16.0,
        ),
      ),
      home: const BottomNavBar(),
    );
  }
}
