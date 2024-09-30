import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          NotificationItem(
            title: 'New Fuel Purchase',
            description: 'You have successfully purchased fuel.',
            time: '10 mins ago',
          ),
          NotificationItem(
            title: 'Load Moving Confirmed',
            description: 'Your load is on the way.',
            time: '30 mins ago',
          ),
          NotificationItem(
            title: 'Jump Start Service Request',
            description: 'Your jump start service request has been accepted.',
            time: '1 hour ago',
          ),
          NotificationItem(
            title: 'Tow Assist',
            description: 'Your tow assist request is being processed.',
            time: '2 hours ago',
          ),
          NotificationItem(
            title: 'Diagnostic Test Completed',
            description: 'Your vehicle diagnostic test has been completed.',
            time: '3 hours ago',
          ),
        ],
      ),
    );
  }
}

class NotificationItem extends StatelessWidget {
  final String title;
  final String description;
  final String time;

  const NotificationItem({
    super.key,
    required this.title,
    required this.description,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              description,
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 8),
            Text(
              time,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
