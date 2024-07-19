import 'package:flutter/material.dart';

class TransferPage extends StatelessWidget {
  const TransferPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 150, 135),
        title: const Text('Transfer'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset(
              'assets/transfer_logo.png',
              width: 150,  // Adjust the size as needed
              height: 150, // Adjust the size as needed
            ),
            const SizedBox(height: 20), // Space between logo and buttons
            Expanded(
              child: GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 1, // Ensures square buttons
                ),
                children: [
                  _buildMenuButton(context, 'Send', Icons.send, '/send'),
                  _buildMenuButton(context, 'Receive', Icons.download, '/receive'),
                  _buildMenuButton(context, 'Airtime', Icons.phone_android, '/airtime'),
                  _buildMenuButton(context, 'Statement Request', Icons.description, '/statement_request'),
                  _buildMenuButton(context, 'Pending Payments', Icons.pending, '/pending_payments'),
                  _buildMenuButton(context, 'Donate', Icons.volunteer_activism, '/donate'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuButton(BuildContext context, String title, IconData icon, String route) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: () => Navigator.pushNamed(context, route),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 50, color: const Color.fromARGB(255, 0, 150, 135)),  // Use green color
            const SizedBox(height: 10),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 18, color: Color.fromARGB(255, 0, 150, 135)), // Use green color
            ),
          ],
        ),
      ),
    );
  }
}
