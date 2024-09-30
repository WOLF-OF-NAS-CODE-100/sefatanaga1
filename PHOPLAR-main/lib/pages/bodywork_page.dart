import 'package:flutter/material.dart';

class BodyworkPage extends StatefulWidget {
  const BodyworkPage({super.key});

  @override
  _BodyworkPageState createState() => _BodyworkPageState();
}

class _BodyworkPageState extends State<BodyworkPage> {
  String? _selectedService;
  double _totalPrice = 0;
  final TextEditingController _locationController = TextEditingController();

  final Map<String, double> _servicePrices = {
    'Minor Repair': 300.0, // Price for minor repair
    'Major Repair': 600.0, // Price for major repair
    'Complete Overhaul': 1200.0, // Price for complete overhaul
  };

  void _calculatePrice() {
    setState(() {
      _totalPrice = _servicePrices[_selectedService] ?? 0;
    });
  }

  void _submitRequest() {
    if (_selectedService != null && _locationController.text.isNotEmpty) {
      _calculatePrice();
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Request Submitted'),
          content: Text(
            'Service: $_selectedService\n'
            'Location: ${_locationController.text}\n'
            'Total Price: R $_totalPrice',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select a service and enter location.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bodywork'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Select Bodywork Service',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            DropdownButtonFormField<String>(
              value: _selectedService,
              hint: const Text('Choose Service Type'),
              items: _servicePrices.keys.map((String service) {
                return DropdownMenuItem<String>(
                  value: service,
                  child: Text(service),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedService = newValue;
                  _calculatePrice();
                });
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: const EdgeInsets.symmetric(horizontal: 12),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Enter Location',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _locationController,
              decoration: InputDecoration(
                hintText: 'Enter location for bodywork service',
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.location_on),
              ),
            ),
            const SizedBox(height: 20),
            if (_totalPrice > 0)
              Text(
                'Total Price: R $_totalPrice',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            const SizedBox(height: 40),
            Center(
              child: ElevatedButton(
                onPressed: _submitRequest,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  minimumSize: const Size(double.infinity, 40),
                ),
                child: const Text(
                  'Submit Request',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
