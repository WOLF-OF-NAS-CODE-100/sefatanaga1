import 'package:flutter/material.dart';
import 'dart:async'; // For Timer

import 'fuel_purchase_page.dart';
import 'move_my_load_page.dart';
import 'jump_start_page.dart';
import 'tow_assist_page.dart';
import 'diagnostic_testing_page.dart';
import 'wash_my_car_page.dart';
import 'perfect_my_driving_page.dart';
import 'bodywork_page.dart';
import 'category_card.dart';
import 'notification_page.dart'; // Import your notification page here

class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  Color _bannerColor = const Color.fromARGB(255, 20, 13, 236);
  String _bannerMessage = 'Welcome to Our Service App!';
  List<Color> _bannerColors = [
    const Color.fromARGB(255, 20, 13, 236),
    const Color.fromARGB(255, 20, 195, 255),
    Colors.purple,
    Colors.orange,
  ];
  List<String> _bannerMessages = [
    'Welcome to Our Service App!',
    'Enjoy great services at your convenience.',
    'Explore the best services!',
    'We are here to help you anytime!',
  ];
  int _currentIndex = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    // Timer to change banner color and message every 60 seconds (1 minute)
    _timer = Timer.periodic(const Duration(minutes: 1), (timer) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % _bannerColors.length;
        _bannerColor = _bannerColors[_currentIndex];
        _bannerMessage = _bannerMessages[_currentIndex];
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // App bar with welcome message and notification icon
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(20),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Welcome, User',
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.notifications),
                  color: Colors.lightBlue,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const NotificationPage(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          // Banner with dynamic color and message
          Container(
            decoration: BoxDecoration(
              color: _bannerColor,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(20),
                bottom: Radius.circular(20),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 8,
                  offset: const Offset(0, 4), // Shadow position
                ),
              ],
            ),
            padding: const EdgeInsets.all(16.0),
            margin: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                Text(
                  _bannerMessage,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          // Search bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                hintText: 'Search for services...',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.grey[200],
                contentPadding: const EdgeInsets.symmetric(vertical: 10),
              ),
            ),
          ),
          // Content section
          Expanded(
            child: ListView(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Categories',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 3,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    CategoryCard(
                      title: 'Fuel Purchase',
                      icon: Icons.local_gas_station,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const FuelPurchasePage(),
                          ),
                        );
                      },
                      imageAsset: '',
                      outerColor: Colors.green,
                    ),
                    CategoryCard(
                      title: 'Move My Load',
                      icon: Icons.local_shipping,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MoveMyLoadPage(),
                          ),
                        );
                      },
                      imageAsset: '',
                      outerColor: Colors.blue,
                    ),
                    CategoryCard(
                      title: 'Jump Start',
                      icon: Icons.flash_on,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const JumpStartPage(),
                          ),
                        );
                      },
                      imageAsset: '',
                      outerColor: Colors.orange,
                    ),
                    CategoryCard(
                      title: 'Tow Assist',
                      icon: Icons.car_repair,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const TowAssistPage(),
                          ),
                        );
                      },
                      imageAsset: '',
                      outerColor: Colors.red,
                    ),
                    CategoryCard(
                      title: 'Diagnostic Testing',
                      icon: Icons.build,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const DiagnosticTestingPage(),
                          ),
                        );
                      },
                      imageAsset: '',
                      outerColor: Colors.purple,
                    ),
                    CategoryCard(
                      title: 'Wash My Car',
                      icon: Icons.local_car_wash,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const WashMyCarPage(),
                          ),
                        );
                      },
                      imageAsset: '',
                      outerColor: Colors.yellow,
                    ),
                    CategoryCard(
                      title: 'Perfect My Driving',
                      icon: Icons.directions_car,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PerfectMyDrivingPage(),
                          ),
                        );
                      },
                      imageAsset: '',
                      outerColor: Colors.teal,
                    ),
                    CategoryCard(
                      title: 'Bodywork',
                      icon: Icons.handyman,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const BodyworkPage(),
                          ),
                        );
                      },
                      imageAsset: '',
                      outerColor: Colors.brown,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
