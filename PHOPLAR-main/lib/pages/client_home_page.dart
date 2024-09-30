import 'package:flutter/material.dart';
import 'home_content.dart';
import 'profile_page.dart';
import 'services_page.dart'; // Import Services page
import 'settings_page.dart'; // Import Settings page

class ClientHomePage extends StatefulWidget {
  const ClientHomePage({super.key});

  @override
  _ClientHomePageState createState() => _ClientHomePageState();
}

class _ClientHomePageState extends State<ClientHomePage> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomeContent(),
    ProfilePage(),
    ServicesPage(), // Use actual Services page widget
    SettingsPage(), // Use actual Settings page widget
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Services',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        backgroundColor:
            const Color.fromARGB(255, 20, 13, 236), // Dark blue background
        selectedItemColor:
            const Color.fromARGB(255, 20, 13, 236), // White for selected items
        unselectedItemColor: const Color.fromARGB(
            255, 20, 13, 236), // Light grey for unselected items
        showUnselectedLabels: true, // Show labels for unselected items
        showSelectedLabels: true, // Show labels for selected items
      ),
    );
  }
}
