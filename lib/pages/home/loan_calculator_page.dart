import 'package:flutter/material.dart';
import 'dart:math'; // Import dart:math for pow function

class LoanCalculatorPage extends StatefulWidget {
  const LoanCalculatorPage({super.key});

  @override
  _LoanCalculatorPageState createState() => _LoanCalculatorPageState();
}

class _LoanCalculatorPageState extends State<LoanCalculatorPage> {
  final _formKey = GlobalKey<FormState>();
  final _amountController = TextEditingController();
  final _interestController = TextEditingController();
  final _termController = TextEditingController();
  String? _result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Loan Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _amountController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Loan Amount',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the loan amount';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _interestController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Annual Interest Rate (%)',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the interest rate';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _termController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Loan Term (years)',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the loan term';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _calculate,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 0, 150, 135), // Corrected style parameter
                ),
                child: const Text('Calculate'),
              ),
              if (_result != null) ...[
                const SizedBox(height: 16),
                Text(
                  _result!,
                  style: const TextStyle(fontSize: 18),
                ),
              ]
            ],
          ),
        ),
      ),
    );
  }

  void _calculate() {
    if (_formKey.currentState?.validate() ?? false) {
      final double amount = double.parse(_amountController.text);
      final double interest = double.parse(_interestController.text) / 100 / 12;
      final int term = int.parse(_termController.text) * 12;

      final double monthlyPayment = (amount * interest * pow(1 + interest, term)) /
          (pow(1 + interest, term) - 1);

      setState(() {
        _result = 'Monthly Payment: ${monthlyPayment.toStringAsFixed(2)}';
      });
    }
  }
}
