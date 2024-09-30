import 'package:flutter/material.dart';

class FuelPurchasePage extends StatefulWidget {
  const FuelPurchasePage({super.key});

  @override
  _FuelPurchasePageState createState() => _FuelPurchasePageState();
}

class _FuelPurchasePageState extends State<FuelPurchasePage> {
  String? _selectedFuelType;
  double _liter = 0;
  double _pricePerLiter = 0;
  double _totalPrice = 0;
  String _location = '';

  final TextEditingController _literController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();

  // Fuel prices (example values)
  final Map<String, double> _fuelPrices = {
    'Petrol': 20.0, // Price per liter in Rands
    'Diesel': 18.0,
    'Gasoline': 25.0,
  };

  void _calculatePrice() {
    setState(() {
      if (_selectedFuelType != null && _liter > 0) {
        _pricePerLiter = _fuelPrices[_selectedFuelType] ?? 0;
        _totalPrice = _pricePerLiter * _liter;
      }
    });
  }

  void _confirmOrder() {
    if (_selectedFuelType != null && _liter > 0 && _location.isNotEmpty) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Order Confirmation'),
          content: Text(
            'Fuel Type: $_selectedFuelType\nLiters: $_liter\nLocation: $_location\nTotal Price: R $_totalPrice',
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
          content: Text('Please select fuel type, enter liters and location.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fuel Purchase'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Select Fuel Type',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField<String>(
              value: _selectedFuelType,
              hint: const Text('Choose Fuel Type'),
              items: _fuelPrices.keys.map((String fuelType) {
                return DropdownMenuItem<String>(
                  value: fuelType,
                  child: Text(fuelType),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedFuelType = newValue;
                });
                _calculatePrice();
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: const EdgeInsets.symmetric(horizontal: 12),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Enter Liters',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _literController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: 'Enter number of liters',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  _liter = double.tryParse(value) ?? 0;
                  _calculatePrice();
                });
              },
            ),
            const SizedBox(height: 20),
            const Text(
              'Enter Location',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _locationController,
              decoration: const InputDecoration(
                hintText: 'Enter location for fuel delivery',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  _location = value;
                });
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculatePrice,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text('Calculate Price'),
            ),
            const SizedBox(height: 20),
            if (_totalPrice > 0)
              Text(
                'Total Price: R $_totalPrice',
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.green),
              ),
            const SizedBox(height: 40),
            Center(
              child: ElevatedButton(
                onPressed: _confirmOrder,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  minimumSize: const Size(double.infinity, 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Confirm Order',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
