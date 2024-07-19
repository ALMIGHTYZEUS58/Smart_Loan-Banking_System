import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../widgets/common_scaffold.dart';

class ProfilePage extends StatefulWidget {
  final int unreadCount;
  final String userName;
  final String userEmail;
  final String userPhone;

  const ProfilePage({
    super.key,
    required this.unreadCount,
    required this.userName,
    required this.userEmail,
    required this.userPhone,
  });

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<String> personalizedMessages = [
    "Keep up the good work with timely payments!",
    "Consider consolidating your debts to lower your interest rates.",
    "Great job on maintaining a low debt level!",
    "Try to increase your savings to improve your financial health.",
  ];

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      currentIndex: 3, // Assuming profile is the 4th tab
      unreadCount: widget.unreadCount,
      body: Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Center(
                  child: _buildProfilePicture(),
                ),
                const SizedBox(height: 20),
                _buildInfoTile('Name', widget.userName),
                const SizedBox(height: 20),
                _buildInfoTile('Email', widget.userEmail),
                const SizedBox(height: 20),
                _buildInfoTile('Phone', widget.userPhone),
                const SizedBox(height: 20),
                const Text(
                  'Credit Score',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 150, 135),
                  ),
                ),
                const SizedBox(height: 20),
                const SizedBox(
                  height: 300, // Set a fixed height for the RadarChart
                  child: ScoreChart(),
                ),
                const SizedBox(height: 20),
                _buildCreditScoreDataSummary(),
                const SizedBox(height: 20),
                _buildLogoutButton(),
              ],
            ),
          ),
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 70), // Adjust this value to move the button up
          child: FloatingActionButton(
            onPressed: () {
              _showTipsDialog(context);
            },
            backgroundColor: const Color.fromARGB(255, 0, 150, 135),
            child: const Icon(Icons.lightbulb_outline),
          ),
        ),
      ),
    );
  }

  Widget _buildProfilePicture() {
    return Stack(
      children: [
        Hero(
          tag: 'profile-pic', // Ensure the tag is unique
          child: CircleAvatar(
            radius: 50,
            backgroundColor: Colors.teal.shade100,
            child: ClipOval(
              child: Image.asset(
                'assets/profile_pic.jpg',
                fit: BoxFit.cover,
                width: 100,
                height: 100,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              border: Border.all(
                color: Colors.grey.shade300,
                width: 1,
              ),
            ),
            child: IconButton(
              icon: const Icon(Icons.camera_alt, size: 16),
              onPressed: () {
                // Handle profile picture change
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildInfoTile(String title, String info) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.black54,
        ),
      ),
      subtitle: Text(
        info,
        style: const TextStyle(
          fontSize: 16,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _buildCreditScoreDataSummary() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Credit Score Data Summary',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 0, 150, 135),
          ),
        ),
        const SizedBox(height: 10),
        Table(
          border: TableBorder.all(color: Colors.black54),
          children: [
            TableRow(
              children: [
                _buildTableCell('Metric'),
                _buildTableCell('Score'),
              ],
            ),
            TableRow(
              children: [
                _buildTableCell('Punctuality'),
                _buildTableCell('80'),
              ],
            ),
            TableRow(
              children: [
                _buildTableCell('Debt Level'),
                _buildTableCell('60'),
              ],
            ),
            TableRow(
              children: [
                _buildTableCell('Income'),
                _buildTableCell('90'),
              ],
            ),
            TableRow(
              children: [
                _buildTableCell('Expenses'),
                _buildTableCell('50'),
              ],
            ),
            TableRow(
              children: [
                _buildTableCell('Savings'),
                _buildTableCell('70'),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTableCell(String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }

  Widget _buildLogoutButton() {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          // Handle logout
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
        ),
        child: const Text('Logout'),
      ),
    );
  }

  void _showTipsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Personalized Financial Tips'),
          content: SingleChildScrollView(
            child: ListBody(
              children: personalizedMessages.map((message) => Text(message)).toList(),
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
      },
    );
  }
}

class ScoreChart extends StatelessWidget {
  const ScoreChart({super.key});

  @override
  Widget build(BuildContext context) {
    return RadarChart(
      RadarChartData(
        dataSets: [
          RadarDataSet(
            fillColor: Colors.blue.withOpacity(0.3),
            borderColor: Colors.blue,
            entryRadius: 2,
            dataEntries: [
              const RadarEntry(value: 3),
              const RadarEntry(value: 4),
              const RadarEntry(value: 5),
              const RadarEntry(value: 2),
              const RadarEntry(value: 3),
            ],
          ),
        ],
        radarBackgroundColor: Colors.transparent,
        borderData: FlBorderData(show: false),
        titlePositionPercentageOffset: 0.1,
        getTitle: (index, angle) {
          switch (index) {
            case 0:
              return RadarChartTitle(
                text: 'Punctuality',
                angle: angle,
              );
            case 1:
              return RadarChartTitle(
                text: 'Debt Level',
                angle: angle,
              );
            case 2:
              return RadarChartTitle(
                text: 'Income',
                angle: angle,
              );
            case 3:
              return RadarChartTitle(
                text: 'Expenses',
                angle: angle,
              );
            case 4:
              return RadarChartTitle(
                text: 'Savings',
                angle: angle,
              );
            default:
              return RadarChartTitle(
                text: '',
                angle: angle,
              );
          }
        },
      ),
    );
  }
}
