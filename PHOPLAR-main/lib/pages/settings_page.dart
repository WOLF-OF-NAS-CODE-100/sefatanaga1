import 'package:flutter/material.dart';
import 'package:sefatafixer/pages/language_settings_page.dart';
import 'settings_option.dart'; // Import for SettingsOption
import 'payment_method_page.dart'; // Import your Payment Method page
import 'privacy_page.dart'; // Import your Privacy page
import 'language_page.dart'; // Import your Language settings page
import 'help_support_page.dart'; // Import your Help & Support page

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const Text(
            'Account Settings',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          SettingsOption(
            title: 'Payment Method',
            icon: Icons.payment,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PaymentMethodPage(),
                ),
              );
            },
          ),
          SettingsOption(
            title: 'Privacy',
            icon: Icons.lock,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PrivacyPage(),
                ),
              );
            },
          ),
          SettingsOption(
            title: 'Language',
            icon: Icons.language,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LanguagePage(),
                ),
              );
            },
          ),
          SettingsOption(
            title: 'Help & Support',
            icon: Icons.help,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HelpSupportPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
