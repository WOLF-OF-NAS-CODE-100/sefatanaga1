import 'package:flutter/material.dart';

class MoveMyLoadPage extends StatefulWidget {
  const MoveMyLoadPage({super.key});

  @override
  _MoveMyLoadPageState createState() => _MoveMyLoadPageState();
}

class _MoveMyLoadPageState extends State<MoveMyLoadPage> {
  final TextEditingController _pickUpController = TextEditingController();
  final TextEditingController _dropOffController = TextEditingController();
  final TextEditingController _distanceController = TextEditingController();
  String? _selectedTruckType;
  double _price = 0.0;

  final Map<String, double> _truckRates = {
    'Small Truck': 5.0, // Rate per kilometer in Rands
    'Medium Truck': 8.0,
    'Large Truck': 12.0,
  };

  void _calculatePrice() {
    setState(() {
      double distance = double.tryParse(_distanceController.text) ?? 0.0;
      double rate = _truckRates[_selectedTruckType ?? ''] ?? 0.0;
      _price = distance * rate;
    });
  }

  void _submitRequest() {
    if (_pickUpController.text.isNotEmpty &&
        _dropOffController.text.isNotEmpty &&
        _selectedTruckType != null &&
        _distanceController.text.isNotEmpty &&
        _price > 0) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Request Submitted'),
          content: Text(
            'Pick-Up Location: ${_pickUpController.text}\n'
            'Drop-Off Location: ${_dropOffController.text}\n'
            'Truck Type: $_selectedTruckType\n'
            'Distance: ${_distanceController.text} km\n'
            'Total Price: R $_price',
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
              Text('Please complete all fields and enter a valid distance.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Move My Load')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Request Details',
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
                      'Pick-Up Location',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: _pickUpController,
                      decoration: InputDecoration(
                        hintText: 'Enter pick-up location',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Drop-Off Location',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: _dropOffController,
                      decoration: InputDecoration(
                        hintText: 'Enter drop-off location',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Select Truck Type',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    DropdownButtonFormField<String>(
                      value: _selectedTruckType,
                      hint: const Text('Choose Truck Type'),
                      items: _truckRates.keys.map((String truckType) {
                        return DropdownMenuItem<String>(
                          value: truckType,
                          child: Text(truckType),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedTruckType = newValue;
                          _calculatePrice();
                        });
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Enter Distance (km)',
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
                        _calculatePrice();
                      },
                    ),
                    const SizedBox(height: 20),
                    if (_price > 0)
                      Text(
                        'Calculated Price: R $_price',
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
