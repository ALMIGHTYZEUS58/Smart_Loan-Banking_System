import 'package:flutter/material.dart';
import 'pages/home/home_page.dart';
import 'pages/home/transfer_page.dart';
import 'pages/home/send_page.dart';
import 'pages/home/receive_page.dart';
import 'pages/home/airtime_page.dart';
import 'pages/home/statement_request_page.dart';
import 'pages/home/pending_payments_page.dart';
import 'pages/home/transactions_page.dart';
import 'pages/home/request_loan_page.dart';
import 'pages/home/loan_history_page.dart';
import 'pages/home/notification_page.dart';
import 'pages/home/help_page.dart';
import 'pages/home/profile_page.dart';
import 'pages/home/loan_calculator_page.dart';
import 'pages/home/settings_page.dart';
import 'pages/home/donate_page.dart';
import 'pages/home/receive_qr_page.dart';
import 'pages/home/scan_page.dart';
import 'pages/starters/splash_page.dart';
import 'pages/starters/login_page.dart';
import 'pages/starters/registration_page.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<CustomNotification> notifications = [
      CustomNotification(isRead: false),
      CustomNotification(isRead: true),
      CustomNotification(isRead: false),
    ];

    final int unreadCount = notifications.where((notification) => !notification.isRead).length;

    return MaterialApp(
      title: 'Fast Funds',
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 0, 150, 135),
        primarySwatch: Colors.teal,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashPage(),
        '/login': (context) => LoginPage(),
        '/register': (context) => RegistrationPage(),
        '/home': (context) => HomePage(unreadCount: unreadCount),
        '/notifications': (context) => NotificationPage(unreadCount: unreadCount),
        '/help': (context) => HelpPage(unreadCount: unreadCount, userName: 'Desmond Kwadwo Owusu'),
        '/profile': (context) => ProfilePage(
              unreadCount: unreadCount,
              userName: 'Desmond Kwadwo Owusu',
              userEmail: 'desmond@example.com',
              userPhone: '123-456-7890',
            ),
        '/transfer': (context) => TransferPage(),
        '/send': (context) => SendPage(),
        '/receive': (context) => ReceivePage(),
        '/airtime': (context) => AirtimePage(),
        '/statement_request': (context) => StatementRequestPage(),
        '/pending_payments': (context) => PendingPaymentsPage(),
        '/transactions': (context) => TransactionsPage(),
        '/request_loan': (context) => RequestLoanPage(),
        '/loan_history': (context) => LoanHistoryPage(),
        '/loan_calculator': (context) => LoanCalculatorPage(),
        '/settings': (context) => SettingsPage(),
        '/donate': (context) => DonatePage(),
        '/receive_qr': (context) => ReceiveQrPage(
              userName: 'Desmond Kwadwo Owusu',
              accountNumber: '24237484838',
            ),
        '/scan': (context) => ScanPage(),
      },
    );
  }
}

class CustomNotification {
  final bool isRead;

  CustomNotification({required this.isRead});
}
