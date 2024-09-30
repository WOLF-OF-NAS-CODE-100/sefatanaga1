import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy Policy'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Add your privacy information text here
                    const Text(
                      'Privacy Information\n\n'
                      'CarEx complies with POPIA set out by the South African government for the protection of privacy of users and service providers. This privacy information refers to the users of our platforms such as Website and software applications used to purchase all our services. Therefore, this makes CarEx committed to taking the privacy of all our users seriously and treated with utmost respect for our users and the law.\n\n'
                      // ... (rest of your privacy policy text)
                      'You can request your data anytime by sending any email to our company or choose to delete your personal information by deleting our mobile application at any time.',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Action when user agrees to the privacy policy
                Navigator.pop(context); // Navigate back or perform any action
              },
              child: const Text('Agree'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent, // Button color
                padding: const EdgeInsets.symmetric(
                    vertical: 15.0, horizontal: 30.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
