import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../widgets/common_scaffold.dart';

class HomePage extends StatefulWidget {
  final int unreadCount;
  const HomePage({super.key, required this.unreadCount});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  bool _isBalanceVisible = false;
  bool _isDebtVisible = false;
  final PageController _controller = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _currentPage = _controller.page?.round() ?? 0;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      currentIndex: 0,
      unreadCount: widget.unreadCount,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  DropdownButton<String>(
                    icon: const Icon(Icons.qr_code_scanner, size: 30),
                    underline: SizedBox(), // Removes the underline
                    onChanged: (String? newValue) {
                      if (newValue == 'Send') {
                        Navigator.pushNamed(context, '/scan');
                      } else if (newValue == 'Receive') {
                        Navigator.pushNamed(context, '/receive_qr');
                      }
                    },
                    items: <String>['Send', 'Receive']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Center(
                child: Image.asset('assets/logo.png', width: 200, height: 100), // Add the logo image
              ),
              const SizedBox(height: 40),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 35,
                    backgroundColor: Colors.teal.shade100,
                    child: ClipOval(
                      child: Image.asset(
                        'assets/profile_pic.jpg', // Path to your profile picture
                        fit: BoxFit.cover,
                        width: 70,
                        height: 70,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome back,',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          'Desmond Kwadwo Owusu',
                          style: TextStyle(
                            fontSize: 20, // Reduced the size of the user's name
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 0, 150, 135),
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              SizedBox(
                height: 150, // Reduced height to 3/4 of 200 (original height was 200)
                child: PageView(
                  controller: _controller,
                  children: [
                    _buildBalanceCard(context),
                    _buildDebtCard(context),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: SmoothPageIndicator(
                  controller: _controller,
                  count: 2,
                  effect: WormEffect(
                    dotHeight: 12,
                    dotWidth: 12,
                    activeDotColor: _currentPage == 0
                        ? const Color.fromARGB(255, 0, 150, 135)
                        : Colors.red,
                    dotColor: Colors.grey,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              GridView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 1.5,
                ),
                children: [
                  _buildGridItem(context, Icons.receipt_long, 'Transactions', '/transactions'),
                  _buildGridItem(context, Icons.sync_alt, 'Transfer', '/transfer'),
                  _buildGridItem(context, Icons.request_quote, 'Request Loan', '/request_loan'),
                  _buildGridItem(context, Icons.history, 'Loan History', '/loan_history'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBalanceCard(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),  // Add horizontal margin for gap
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 0, 150, 135),
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Main Account Number: 24237484838',
            style: TextStyle(
              fontSize: 16, // Font size for account number
              fontWeight: FontWeight.bold,
              color: Colors.white70,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'BALANCE:',
                    style: TextStyle(
                      fontSize: 22, // Increased font size
                      fontWeight: FontWeight.bold,
                      color: Colors.white70,
                    ),
                  ),
                  Text(
                    _isBalanceVisible ? 'GHS 5,000.00' : 'GHS ********',
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              IconButton(
                icon: Icon(
                  _isBalanceVisible ? Icons.visibility : Icons.visibility_off,
                  color: Colors.white70,
                ),
                onPressed: () {
                  setState(() {
                    _isBalanceVisible = !_isBalanceVisible;
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDebtCard(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),  // Add horizontal margin for gap
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Loan Account Identifier: 123456789',
            style: TextStyle(
              fontSize: 16, // Font size for account ID
              fontWeight: FontWeight.bold,
              color: Colors.white70,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'LOAN DEBT:',
                    style: TextStyle(
                      fontSize: 22, // Increased font size
                      fontWeight: FontWeight.bold,
                      color: Colors.white70,
                    ),
                  ),
                  Text(
                    _isDebtVisible ? 'GHS 3,000.00' : 'GHS ********',
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              IconButton(
                icon: Icon(
                  _isDebtVisible ? Icons.visibility : Icons.visibility_off,
                  color: Colors.white70,
                ),
                onPressed: () {
                  setState(() {
                    _isDebtVisible = !_isDebtVisible;
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildGridItem(BuildContext context, IconData icon, String title, String route) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, route);
        },
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
            Icon(icon, size: 40, color: const Color.fromARGB(255, 0, 150, 135)),  // Use primary color
            const SizedBox(height: 8),  // Reduced spacing
            Text(
              title,
              style: const TextStyle(
                fontSize: 14,  // Reduced font size
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
