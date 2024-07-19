import 'package:flutter/material.dart';

class StatementRequestPage extends StatefulWidget {
  const StatementRequestPage({super.key});

  @override
  _StatementRequestPageState createState() => _StatementRequestPageState();
}

class _StatementRequestPageState extends State<StatementRequestPage> {
  final _formKey = GlobalKey<FormState>();
  DateTime? _startDate;
  DateTime? _endDate;
  String _email = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Request Statement'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Request Statement',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue.shade900,
                ),
              ),
              const SizedBox(height: 16),
              _buildDateField('Start Date', _startDate, (date) {
                setState(() {
                  _startDate = date;
                });
              }),
              const SizedBox(height: 16),
              _buildDateField('End Date', _endDate, (date) {
                setState(() {
                  _endDate = date;
                });
              }),
              const SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Email Address',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email address';
                  }
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
                onSaved: (value) {
                  _email = value!;
                },
              ),
              const SizedBox(height: 32),
              Center(
                child: ElevatedButton(
                  onPressed: _submitRequest,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Request Statement',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDateField(String label, DateTime? date, ValueChanged<DateTime> onDateSelected) {
    return GestureDetector(
      onTap: () async {
        final selectedDate = await showDatePicker(
          context: context,
          initialDate: date ?? DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime.now(),
        );
        if (selectedDate != null) {
          onDateSelected(selectedDate);
        }
      },
      child: AbsorbPointer(
        child: TextFormField(
          decoration: InputDecoration(
            labelText: label,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          validator: (value) {
            if (date == null) {
              return 'Please select a $label';
            }
            return null;
          },
          controller: TextEditingController(
            text: date != null ? date.toLocal().toString().split(' ')[0] : '',
          ),
        ),
      ),
    );
  }

  void _submitRequest() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Perform the statement request operation here
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Statement Request Confirmation'),
          content: Text(
            'Request statement from ${_startDate!.toLocal().toString().split(' ')[0]} to ${_endDate!.toLocal().toString().split(' ')[0]} and send to $_email?',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Perform the email sending operation here
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Statement requested successfully')),
                );
              },
              child: const Text('Confirm'),
            ),
          ],
        ),
      );
    }
  }
}
