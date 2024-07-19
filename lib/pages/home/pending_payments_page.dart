import 'package:flutter/material.dart';

class PendingPaymentsPage extends StatelessWidget {
  const PendingPaymentsPage({super.key});

  final List<Map<String, String>> pendingPayments = const [
    {'title': 'Loan Payment', 'dueDate': '2024-07-20', 'amount': 'GHS 200.00'},
    {'title': 'Credit Card Bill', 'dueDate': '2024-07-25', 'amount': 'GHS 150.00'},
    {'title': 'Utility Bill', 'dueDate': '2024-07-30', 'amount': 'GHS 100.00'},
    {'title': 'Rent Payment', 'dueDate': '2024-08-01', 'amount': 'GHS 300.00'},
    {'title': 'Subscription', 'dueDate': '2024-08-05', 'amount': 'GHS 50.00'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pending Payments'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: pendingPayments.length,
        itemBuilder: (context, index) {
          final payment = pendingPayments[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              title: Text(
                payment['title']!,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              subtitle: Text(payment['dueDate']!),
              trailing: Text(
                payment['amount']!,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.red,
                ),
              ),
              onTap: () {
                _showPaymentDetails(context, payment);
              },
            ),
          );
        },
      ),
    );
  }

  void _showPaymentDetails(BuildContext context, Map<String, String> payment) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('${payment['title']} Details'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Due Date: ${payment['dueDate']}'),
            const SizedBox(height: 8),
            Text('Amount: ${payment['amount']}'),
            const SizedBox(height: 8),
            const Text('Status: Pending'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }
}
