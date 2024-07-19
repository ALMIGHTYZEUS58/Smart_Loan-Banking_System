import 'package:flutter/material.dart';
import '../widgets/common_scaffold.dart'; // Adjusted import to match directory structure

class AnotherPage extends StatelessWidget {
  final int unreadCount;

  const AnotherPage({super.key, required this.unreadCount});

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Another Page',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Go Back'),
            ),
          ],
        ),
      ),
      currentIndex: 1, // Set the appropriate index for the bottom navigation
      unreadCount: unreadCount, // Pass unreadCount to CommonScaffold
    );
  }
}
