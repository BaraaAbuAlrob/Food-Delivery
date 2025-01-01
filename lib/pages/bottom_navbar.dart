import 'package:flutter/material.dart';
import 'package:food_delivery/pages/account_page.dart';
import 'package:food_delivery/pages/favorite_page.dart';
import 'package:food_delivery/pages/home_page.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  final List<Widget> _bodyWidgets = const [
    HomePage(),
    FavoritePage(),
    AccountPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Foodak',
          style: TextStyle(
            fontFamily: 'Times New Roman',
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding:
              EdgeInsets.only(top: MediaQuery.sizeOf(context).height * 0.15),
          children: <Widget>[
            ListTile(
              title: const Text(
                'Home',
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text(
                'About',
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text(
                'Contact',
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: _bodyWidgets[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey[100],
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            tooltip: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
            tooltip: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
            tooltip: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).primaryColor,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
