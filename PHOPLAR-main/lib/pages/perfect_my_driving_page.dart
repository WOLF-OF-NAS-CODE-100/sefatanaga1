import 'package:flutter/material.dart';

class PerfectMyDrivingPage extends StatefulWidget {
  const PerfectMyDrivingPage({super.key});

  @override
  _PerfectMyDrivingPageState createState() => _PerfectMyDrivingPageState();
}

class _PerfectMyDrivingPageState extends State<PerfectMyDrivingPage> {
  String? _selectedProgram;
  double _totalPrice = 0;
  String _location = '';
  List<Map<String, String>> _drivingSchools = [];

  final TextEditingController _locationController = TextEditingController();

  final Map<String, double> _programPrices = {
    'Basic Training': 500.0, // Price for basic training
    'Advanced Training': 800.0, // Price for advanced training
    'Professional Training': 1200.0, // Price for professional training
  };

  void _calculatePrice() {
    setState(() {
      _totalPrice = _programPrices[_selectedProgram] ?? 0;
    });
  }

  void _findNearestSchools() {
    // Placeholder for fetching driving schools
    setState(() {
      _drivingSchools = [
        {'name': 'DriveRight School', 'address': '123 Main St'},
        {'name': 'Speedy Learn Driving', 'address': '456 Elm St'},
        {'name': 'Safe Roads Academy', 'address': '789 Oak St'},
      ];
    });
  }

  void _submitRequest() {
    if (_selectedProgram != null && _locationController.text.isNotEmpty) {
      setState(() {
        _location = _locationController.text;
        _findNearestSchools(); // Find nearest schools after submission
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
              Text('Program: $_selectedProgram'),
              Text('Location: $_location'),
              Text('Total Price: R $_totalPrice'),
              const SizedBox(height: 10),
              const Text(
                'Nearest Driving Schools:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              ..._drivingSchools.map((school) {
                return ListTile(
                  title: Text(school['name']!),
                  subtitle: Text(school['address']!),
                );
              }).toList(),
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
          content: Text('Please select a program and enter location.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfect My Driving'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Select Training Program',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            DropdownButtonFormField<String>(
              value: _selectedProgram,
              hint: const Text('Choose Training Program'),
              items: _programPrices.keys.map((String program) {
                return DropdownMenuItem<String>(
                  value: program,
                  child: Text(program),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedProgram = newValue;
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
                hintText: 'Enter location for training',
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
