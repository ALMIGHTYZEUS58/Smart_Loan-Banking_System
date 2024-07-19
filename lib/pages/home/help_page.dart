import 'package:flutter/material.dart';
import '../../widgets/common_scaffold.dart';

class HelpPage extends StatelessWidget {
  final int unreadCount;
  final String userName;

  const HelpPage({
    super.key,
    required this.unreadCount,
    required this.userName,
  });

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      currentIndex: 2,
      unreadCount: unreadCount,
      body: GestureDetector(
        onTap: () {
          // Dismiss the keyboard when tapping outside of a text field
          FocusScope.of(context).unfocus();
        },
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    const Text(
                      'Help & Contact Us',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 0, 150, 135),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'If you have any questions or need assistance, please fill out the form below or contact our support team.',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 20),
                    _buildContactForm(),
                    const SizedBox(height: 20),
                    const Text(
                      'Frequently Asked Questions',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 0, 150, 135),
                      ),
                    ),
                    const SizedBox(height: 10),
                    _buildFAQ(),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 150,
              right: 20,
              child: FloatingActionButton(
                heroTag: 'loanCalculatorFAB', // Unique Hero tag
                onPressed: () {
                  Navigator.pushNamed(context, '/loan_calculator');
                },
                backgroundColor: const Color.fromARGB(255, 0, 150, 135),
                child: const Icon(Icons.calculate, color: Colors.white),
              ),
            ),
            Positioned(
              bottom: 80,
              right: 20,
              child: FloatingActionButton(
                heroTag: 'chatBotFAB', // Unique Hero tag
                onPressed: () {
                  _showChatBotDialog(context, userName);
                },
                backgroundColor: const Color.fromARGB(255, 0, 150, 135),
                child: const Icon(Icons.smart_toy_outlined),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactForm() {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Your Name',
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
          const SizedBox(height: 10),
          TextFormField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter your name',
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Your Email',
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
          const SizedBox(height: 10),
          TextFormField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter your email',
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Message',
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
          const SizedBox(height: 10),
          TextFormField(
            maxLines: 5,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter your message',
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              onPressed: () {
                // Handle form submission
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 0, 150, 135),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              ),
              child: const Text(
                'Submit',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFAQ() {
    final List<Map<String, String>> faqs = [
      {
        'question': 'How can I apply for a loan?',
        'answer': 'To apply for a loan, navigate to the "Request Loan" section and fill out the necessary information.',
      },
      {
        'question': 'What is the interest rate?',
        'answer': 'The interest rate varies depending on the type of loan. Please check the loan details for more information.',
      },
      {
        'question': 'How do I contact customer support?',
        'answer': 'You can contact customer support by filling out the form above or calling our support hotline at 1-800-123-4567.',
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: faqs.map((faq) {
        return ExpansionTile(
          title: Text(
            faq['question']!,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                faq['answer']!,
                style: const TextStyle(fontSize: 14, color: Colors.black),
              ),
            ),
          ],
        );
      }).toList(),
    );
  }

  void _showChatBotDialog(BuildContext context, String userName) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ChatBotDialog(userName: userName);
      },
    );
  }
}

class ChatBotDialog extends StatefulWidget {
  final String userName;

  const ChatBotDialog({super.key, required this.userName});

  @override
  _ChatBotDialogState createState() => _ChatBotDialogState();
}

class _ChatBotDialogState extends State<ChatBotDialog> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, String>> _messages = [];
  bool _isUserNameAsked = true;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Chat with Bot'),
      content: SizedBox(
        width: double.maxFinite,
        height: 300,
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  final message = _messages[index];
                  return Align(
                    alignment: message['sender'] == 'User'
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 2.0),
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: message['sender'] == 'User'
                            ? Colors.blue[100]
                            : Colors.grey[300],
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Text(message['message']!),
                    ),
                  );
                },
              ),
            ),
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Type your message',
              ),
              onSubmitted: _handleMessage,
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('Close'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }

  void _handleMessage(String message) {
    setState(() {
      _messages.add({'sender': 'User', 'message': message});
      if (_isUserNameAsked) {
        _messages.add({
          'sender': 'Bot',
          'message': 'Hi ${widget.userName}, how can I assist you today?'
        });
        _isUserNameAsked = false;
      } else {
        _messages.add({
          'sender': 'Bot',
          'message': 'Our chatbot is currently under maintenance. An official will contact you soon.'
        });
      }
    });
    _controller.clear();
  }
}
