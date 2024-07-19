import 'package:flutter/material.dart';
import '../../widgets/common_scaffold.dart';

class NotificationPage extends StatefulWidget {
  final int unreadCount;
  const NotificationPage({super.key, required this.unreadCount});

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  NotificationItem? _selectedNotification;
  int _unreadCount;

  _NotificationPageState() : _unreadCount = notifications.where((notification) => !notification.isRead).length;

  void _markAsRead(NotificationItem notification) {
    setState(() {
      if (!notification.isRead) {
        notification.isRead = true;
        _unreadCount--;
      }
      _selectedNotification = notification;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      currentIndex: 1,
      unreadCount: _unreadCount,
      body: Stack(
        children: [
          ListView.builder(
            itemCount: notifications.length,
            itemBuilder: (context, index) {
              return _buildNotificationCard(context, notifications[index]);
            },
          ),
          if (_selectedNotification != null)
            Positioned.fill(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedNotification = null;
                  });
                },
                child: Container(
                  color: Colors.black54,
                  child: Center(
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _selectedNotification!.title,
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 0, 150, 135),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            _selectedNotification!.content,
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildNotificationCard(BuildContext context, NotificationItem notification) {
    return Card(
      margin: const EdgeInsets.all(10),
      color: notification.isRead ? Colors.white : Colors.teal.shade50,
      child: InkWell(
        onTap: () {
          _markAsRead(notification);
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                notification.title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: notification.isRead ? const Color.fromARGB(255, 0, 150, 135) : Colors.teal,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                notification.content,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NotificationItem {
  final String title;
  final String content;
  bool isRead;

  NotificationItem({required this.title, required this.content, this.isRead = false});
}

final List<NotificationItem> notifications = [
  NotificationItem(
    title: 'Loan Approved',
    content: 'Your loan application has been approved. Please check your account for details.',
    isRead: false,
  ),
  NotificationItem(
    title: 'Payment Reminder',
    content: 'Your loan payment is due in 3 days. Please make the payment to avoid late fees.',
    isRead: true,
  ),
  NotificationItem(
    title: 'Transaction Alert',
    content: 'You have received GHS 500.00 from Desmond Kwadwo Owusu. Please verify the transaction in your account.',
    isRead: false,
  ),
  NotificationItem(
    title: 'Promotional Offer',
    content: 'Get a discount on your next loan processing fee. Limited time offer! Apply now to save more.',
    isRead: true,
  ),
  NotificationItem(
    title: 'Loan Rejected',
    content: 'Your loan application has been rejected due to insufficient credit history. Please contact support for more details.',
    isRead: false,
  ),
  NotificationItem(
    title: 'Low Balance Alert',
    content: 'Your account balance is below GHS 100. Please deposit funds to avoid overdraft fees.',
    isRead: true,
  ),
  NotificationItem(
    title: 'Loan Payment Successful',
    content: 'Your recent loan payment of GHS 1,000 has been successfully processed.',
    isRead: false,
  ),
  NotificationItem(
    title: 'New Feature Available',
    content: 'Check out our new feature that allows you to set up automatic payments for your loans.',
    isRead: true,
  ),
  NotificationItem(
    title: 'Update Your Profile',
    content: 'Please update your profile information to ensure you continue receiving important updates about your account.',
    isRead: false,
  ),
  NotificationItem(
    title: 'Annual Financial Summary',
    content: 'Your annual financial summary for the year 2023 is now available. View it in your account.',
    isRead: true,
  ),
  NotificationItem(
    title: 'Security Alert',
    content: 'We noticed a new login to your account from a different device. If this wasn’t you, please change your password immediately.',
    isRead: false,
  ),
  NotificationItem(
    title: 'Loan Application Received',
    content: 'We have received your loan application. It is currently under review and we will notify you once the process is complete.',
    isRead: true,
  ),
  NotificationItem(
    title: 'Scheduled Maintenance',
    content: 'Our system will be undergoing scheduled maintenance on Saturday from 12:00 AM to 6:00 AM. Please plan your transactions accordingly.',
    isRead: false,
  ),
  NotificationItem(
    title: 'Payment Confirmation',
    content: 'We have received your payment of GHS 200.00. Thank you for your prompt response.',
    isRead: true,
  ),
  NotificationItem(
    title: 'Profile Update Success',
    content: 'Your profile information has been successfully updated. Thank you for keeping your information current.',
    isRead: false,
  ),
  NotificationItem(
    title: 'Interest Rate Change',
    content: 'Please note that the interest rate for personal loans has been updated. Check our website for more details.',
    isRead: true,
  ),
  NotificationItem(
    title: 'Loan Agreement Signed',
    content: 'Your loan agreement has been signed and approved. Please check your email for a copy of the agreement.',
    isRead: false,
  ),
  NotificationItem(
    title: 'Referral Bonus',
    content: 'Congratulations! You have received a referral bonus of GHS 50.00 for referring a new user to our service.',
    isRead: true,
  ),
  NotificationItem(
    title: 'Monthly Statement Available',
    content: 'Your monthly account statement for June is now available. View it in your account.',
    isRead: false,
  ),
  NotificationItem(
    title: 'Account Verification',
    content: 'Please verify your email address to complete your account setup. A verification link has been sent to your email.',
    isRead: true,
  ),
];
