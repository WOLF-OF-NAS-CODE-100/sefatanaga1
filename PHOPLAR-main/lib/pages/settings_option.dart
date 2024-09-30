import 'package:flutter/material.dart';

class SettingsOption extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap; // Callback for the tap event

  const SettingsOption({
    required this.title,
    required this.icon,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: Icon(icon, size: 40),
        title: Text(title, style: const TextStyle(fontSize: 18)),
        onTap: onTap, // Call the onTap callback when tapped
      ),
    );
  }
}
