import 'package:flutter/material.dart';

class LanguageSettingsPage extends StatelessWidget {
  const LanguageSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Language Settings'),
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const Text(
            'Select Language',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          LanguageOption(title: 'English'),
          LanguageOption(title: 'Spanish'),
          LanguageOption(title: 'French'),
          // Add more languages as needed
        ],
      ),
    );
  }
}

class LanguageOption extends StatelessWidget {
  final String title;

  const LanguageOption({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        title: Text(title, style: const TextStyle(fontSize: 18)),
        onTap: () {
          // Add logic to change the app language
        },
      ),
    );
  }
}
