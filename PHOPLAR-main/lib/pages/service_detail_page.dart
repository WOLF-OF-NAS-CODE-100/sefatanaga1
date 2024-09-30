import 'package:flutter/material.dart';

class ServiceDetailPage extends StatefulWidget {
  final String serviceTitle;

  const ServiceDetailPage({required this.serviceTitle, super.key});

  @override
  _ServiceDetailPageState createState() => _ServiceDetailPageState();
}

class _ServiceDetailPageState extends State<ServiceDetailPage> {
  final TextEditingController _pickupController = TextEditingController();
  final TextEditingController _dropoffController = TextEditingController();
  double _price = 0.0;

  void _calculatePrice() {
    // Example pricing logic: you can modify this as needed
    const pricePerKm = 10.0; // 10 Rands per km
    // Assuming a fixed distance for demonstration; you can adjust logic as needed
    double distance = 5.0; // Placeholder distance in km

    setState(() {
      _price = distance * pricePerKm;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.serviceTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: _pickupController,
              decoration: const InputDecoration(
                labelText: 'Pick-up Location',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _dropoffController,
              decoration: const InputDecoration(
                labelText: 'Drop-off Location',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculatePrice,
              child: const Text('Calculate'),
            ),
            const SizedBox(height: 20),
            // Removed distance display, showing only price
            Text('Price: R ${_price.toStringAsFixed(2)}'),
          ],
        ),
      ),
    );
  }
}
