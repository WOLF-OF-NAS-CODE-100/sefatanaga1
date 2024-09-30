import 'package:flutter/material.dart';

class TowAssistPage extends StatefulWidget {
  const TowAssistPage({super.key});

  @override
  _TowAssistPageState createState() => _TowAssistPageState();
}

class _TowAssistPageState extends State<TowAssistPage> {
  final TextEditingController _pickupLocationController =
      TextEditingController();
  final TextEditingController _dropoffLocationController =
      TextEditingController();
  final TextEditingController _distanceController = TextEditingController();
  String? _selectedCarType;
  double _estimatedCost = 0.0;

  // Define tow rates (example values)
  final double _baseRate = 500.0; // Base rate in Rands
  final double _perKmRate = 10.0; // Rate per kilometer in Rands
  final Map<String, double> _carTypeRates = {
    'Standard': 0.0, // No additional charge
    'SUV': 50.0, // Additional charge for SUV
    'Luxury': 100.0, // Additional charge for Luxury vehicles
  };

  void _calculateCost() {
    setState(() {
      double distance = double.tryParse(_distanceController.text) ?? 0;
      double additionalCharge = _carTypeRates[_selectedCarType] ?? 0;
      _estimatedCost = _baseRate + (_perKmRate * distance) + additionalCharge;
    });
  }

  void _submitRequest() {
    if (_pickupLocationController.text.isNotEmpty &&
        _dropoffLocationController.text.isNotEmpty &&
        _distanceController.text.isNotEmpty &&
        _selectedCarType != null &&
        _estimatedCost > 0) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Request Submitted'),
          content: Text(
            'Pickup Location: ${_pickupLocationController.text}\n'
            'Drop-off Location: ${_dropoffLocationController.text}\n'
            'Distance: ${_distanceController.text} km\n'
            'Car Type: $_selectedCarType\n'
            'Estimated Cost: R $_estimatedCost',
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
          content:
              Text('Please complete all fields and provide valid information.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tow Assist'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Request Tow Assistance',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Pickup Location',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: _pickupLocationController,
                      decoration: InputDecoration(
                        hintText: 'Enter pickup location',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Drop-off Location',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: _dropoffLocationController,
                      decoration: InputDecoration(
                        hintText: 'Enter drop-off location',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Distance (in km)',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: _distanceController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'Enter distance in kilometers',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onChanged: (value) {
                        _calculateCost();
                      },
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Select Car Type',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    DropdownButtonFormField<String>(
                      value: _selectedCarType,
                      hint: const Text('Choose Car Type'),
                      items: _carTypeRates.keys.map((String carType) {
                        return DropdownMenuItem<String>(
                          value: carType,
                          child: Text(carType),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedCarType = newValue;
                          _calculateCost();
                        });
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 12),
                      ),
                    ),
                    const SizedBox(height: 20),
                    if (_estimatedCost > 0)
                      Text(
                        'Estimated Cost: R $_estimatedCost',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _submitRequest,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Submit Request',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
