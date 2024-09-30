import 'package:flutter/material.dart';

class DrivingImprovementPage extends StatelessWidget {
  const DrivingImprovementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Driving Improvement'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Improve Your Driving Skills',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Enroll in a program to enhance your driving techniques.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            // Placeholder for driving improvement services
            Expanded(
              child: ListView.builder(
                itemCount: 5, // Sample 5 improvement services
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Icon(Icons.drive_eta),
                    title: Text('Driving School $index'),
                    subtitle: Text('Location: School Location $index'),
                    trailing: Text('R800'), // Placeholder pricing
                    onTap: () {
                      // Navigate to service details page
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
