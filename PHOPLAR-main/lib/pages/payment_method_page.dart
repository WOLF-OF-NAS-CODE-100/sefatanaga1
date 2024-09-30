import 'package:flutter/material.dart';

class PaymentMethodPage extends StatefulWidget {
  const PaymentMethodPage({super.key});

  @override
  _PaymentMethodPageState createState() => _PaymentMethodPageState();
}

class _PaymentMethodPageState extends State<PaymentMethodPage> {
  final List<String> _paymentMethods = [
    'Credit Card',
    'Debit Card',
    'PayPal',
    'Bank Transfer'
  ];
  String? _selectedMethod;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment Methods'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Select Payment Method',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: _paymentMethods.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_paymentMethods[index]),
                    leading: Radio<String>(
                      value: _paymentMethods[index],
                      groupValue: _selectedMethod,
                      onChanged: (value) {
                        setState(() {
                          _selectedMethod = value;
                        });
                      },
                    ),
                    onTap: () {
                      setState(() {
                        _selectedMethod = _paymentMethods[index];
                      });
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Implement payment method confirmation or navigation
                if (_selectedMethod != null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content:
                          Text('Selected Payment Method: $_selectedMethod'),
                    ),
                  );
                }
              },
              child: const Text('Confirm Selection'),
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    const Color(0xFF140DEC), // Custom color for the button
              ),
            ),
          ],
        ),
      ),
    );
  }
}
