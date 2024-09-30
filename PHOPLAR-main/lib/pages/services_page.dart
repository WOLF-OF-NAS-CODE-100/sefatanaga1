import 'package:flutter/material.dart';

class ServicesPage extends StatelessWidget {
  const ServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const Text(
            'Available Services',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          ServiceCard(title: 'Fuel Purchase', icon: Icons.local_gas_station),
          ServiceCard(title: 'Move My Load', icon: Icons.local_shipping),
          ServiceCard(title: 'Jump Start', icon: Icons.flash_on),
          ServiceCard(title: 'Tow Assist', icon: Icons.car_repair),
          ServiceCard(title: 'Diagnostic Testing', icon: Icons.build),
          ServiceCard(title: 'Wash My Car', icon: Icons.local_car_wash),
          ServiceCard(title: 'Perfect My Driving', icon: Icons.directions_car),
          ServiceCard(title: 'Bodywork', icon: Icons.build),
        ],
      ),
    );
  }
}

class ServiceCard extends StatelessWidget {
  final String title;
  final IconData icon;

  const ServiceCard({required this.title, required this.icon, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: Icon(icon, size: 40),
        title: Text(title, style: const TextStyle(fontSize: 18)),
        onTap: () {
          // Add navigation or action here
        },
      ),
    );
  }
}
