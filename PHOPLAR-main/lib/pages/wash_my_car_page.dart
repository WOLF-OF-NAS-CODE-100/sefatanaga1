import 'package:flutter/material.dart';

class WashMyCarPage extends StatefulWidget {
  const WashMyCarPage({super.key});

  @override
  _WashMyCarPageState createState() => _WashMyCarPageState();
}

class _WashMyCarPageState extends State<WashMyCarPage> {
  String? _selectedWashType;
  double _totalPrice = 0;
  String _location = '';

  final TextEditingController _locationController = TextEditingController();

  final Map<String, double> _washPrices = {
    'Basic Wash': 100.0, // Price for basic wash
    'Deluxe Wash': 150.0, // Price for deluxe wash
    'Premium Wash': 200.0, // Price for premium wash
  };

  void _calculatePrice() {
    setState(() {
      _totalPrice = _washPrices[_selectedWashType] ?? 0;
    });
  }

  void _submitRequest() {
    if (_selectedWashType != null && _locationController.text.isNotEmpty) {
      setState(() {
        _location = _locationController.text;
      });
      _calculatePrice();
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Request Submitted'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Wash Type: $_selectedWashType'),
              Text('Location: $_location'),
              Text('Total Price: R $_totalPrice'),
              const SizedBox(height: 10),
              const Text(
                'View the location on the map below.',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              // Placeholder for Google Map integration
              Container(
                height: 200,
                color: Colors.grey[200],
                child: Center(
                  child: Text(
                    'Map Placeholder\n(Integrate Google Maps here)',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ),
              ),
            ],
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
          content: Text('Please select a wash type and enter location.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wash My Car'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Select Wash Type',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            DropdownButtonFormField<String>(
              value: _selectedWashType,
              hint: const Text('Choose Wash Type'),
              items: _washPrices.keys.map((String washType) {
                return DropdownMenuItem<String>(
                  value: washType,
                  child: Text(washType),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedWashType = newValue;
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
                hintText: 'Enter location for car wash',
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
