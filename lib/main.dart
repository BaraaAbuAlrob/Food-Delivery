import 'dart:io';

import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

//  import 'package:flutter/services.dart';
import 'package:food_delivery/pages/bottom_navbar.dart';
import 'package:food_delivery/pages/food_details_page.dart';

void main() {
  // // Ensure Flutter is fully initialized before calling platform-specific APIs.
  // WidgetsFlutterBinding.ensureInitialized();

  // // Lock the application to portrait mode only.
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  //   DeviceOrientation.portraitDown,
  // ]);
  runApp(
    (!kIsWeb && (Platform.isAndroid || Platform.isIOS))
        ? const MyApp()
        : DevicePreview(enabled: true, builder: (context) => const MyApp()),
  );
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
        listTileTheme: const ListTileThemeData(iconColor: Colors.deepOrange),
        dividerTheme: const DividerThemeData(indent: 16.0, endIndent: 16.0),
      ),
      routes: {
        '/': (context) => const BottomNavBar(),
        '/food-details': (context) => const FoodDetailsPage(),
      },
    );
  }
}
