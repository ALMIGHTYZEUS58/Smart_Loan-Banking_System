import 'package:flutter/material.dart';
import '../../models/loan.dart';

class LoanHistoryPage extends StatefulWidget {
  const LoanHistoryPage({super.key});

  @override
  _LoanHistoryPageState createState() => _LoanHistoryPageState();
}

class _LoanHistoryPageState extends State<LoanHistoryPage> {
  final List<Loan> loans = [
    Loan(
      amount: 1000,
      dateApplied: '2023-01-01',
      status: 'Approved',
      dateApprovedRejected: '2023-01-05',
      interestRate: 5.5,
      deadline: '2024-01-01',
      didUserDefault: false,
      defaultDuration: 0,
      penalty: '0',
      monthsUsedToPay: 12,
      purpose: 'Business Expansion',
      transactions: [
        {'date': '2023-02-01', 'transactionId': 'TXN001', 'amount': '100'},
        {'date': '2023-03-01', 'transactionId': 'TXN002', 'amount': '200'},
        {'date': '2023-04-01', 'transactionId': 'TXN003', 'amount': '10'},
        {'date': '2023-05-01', 'transactionId': 'TXN004', 'amount': '90'},
        {'date': '2023-06-01', 'transactionId': 'TXN005', 'amount': '100'},
        {'date': '2023-07-01', 'transactionId': 'TXN006', 'amount': '300'},
        {'date': '2023-08-01', 'transactionId': 'TXN007', 'amount': '20'},
        {'date': '2023-09-01', 'transactionId': 'TXN008', 'amount': '20'},
        {'date': '2023-10-01', 'transactionId': 'TXN009', 'amount': '150'},
        {'date': '2023-11-01', 'transactionId': 'TXN010', 'amount': '20'},
        {'date': '2023-12-01', 'transactionId': 'TXN011', 'amount': '35'},
        {'date': '2024-01-01', 'transactionId': 'TXN012', 'amount': '10'},
      ],
      referenceNumber: 'REF12345',
    ),
    Loan(
      amount: 2000,
      dateApplied: '2023-02-01',
      status: 'Pending',
      interestRate: 6.0,
      didUserDefault: false,
      defaultDuration: 0,
      penalty: '0',
      monthsUsedToPay: 0,
      purpose: 'Home Renovation',
      transactions: [],
      referenceNumber: 'REF12346',
    ),
    Loan(
      amount: 1500,
      dateApplied: '2023-03-01',
      status: 'Rejected',
      dateApprovedRejected: '2023-03-05',
      interestRate: 7.0,
      didUserDefault: false,
      defaultDuration: 0,
      penalty: '0',
      monthsUsedToPay: 0,
      purpose: 'Car Purchase',
      transactions: [],
      rejectionReason: 'Low Credit Score',
      referenceNumber: 'REF12347',
    ),
    Loan(
      amount: 2500,
      dateApplied: '2023-04-01',
      status: 'Approved',
      dateApprovedRejected: '2023-04-05',
      interestRate: 4.5,
      deadline: '2026-04-01',
      didUserDefault: false,
      defaultDuration: 0,
      penalty: '0',
      monthsUsedToPay: 36,
      purpose: 'Education',
      transactions: [
        {'date': '2023-05-01', 'transactionId': 'TXN013', 'amount': '500'},
        {'date': '2023-06-01', 'transactionId': 'TXN014', 'amount': '200'},
        {'date': '2024-09-01', 'transactionId': 'TXN029', 'amount': '200'},
        {'date': '2025-12-01', 'transactionId': 'TXN044', 'amount': '100'},
        {'date': '2026-01-01', 'transactionId': 'TXN045', 'amount': '1000'},
        {'date': '2026-02-01', 'transactionId': 'TXN046', 'amount': '600'},
        {'date': '2026-02-01', 'transactionId': 'TXN046', 'amount': '12.50'},
      ],
      referenceNumber: 'REF12348',
    ),
    Loan(
      amount: 3000,
      dateApplied: '2023-05-01',
      status: 'Approved',
      dateApprovedRejected: '2023-05-05',
      interestRate: 5.0,
      deadline: '2024-05-01',
      didUserDefault: false,
      defaultDuration: 0,
      penalty: '0',
      monthsUsedToPay: 12,
      purpose: 'Vacation',
      transactions: [
        {'date': '2023-06-01', 'transactionId': 'TXN047', 'amount': '250'},
        {'date': '2023-07-01', 'transactionId': 'TXN048', 'amount': '250'},
        {'date': '2023-08-01', 'transactionId': 'TXN049', 'amount': '250'},
        {'date': '2023-09-01', 'transactionId': 'TXN050', 'amount': '250'},
        {'date': '2023-10-01', 'transactionId': 'TXN051', 'amount': '250'},
        {'date': '2023-11-01', 'transactionId': 'TXN052', 'amount': '250'},
        {'date': '2023-12-01', 'transactionId': 'TXN053', 'amount': '250'},
        {'date': '2024-01-01', 'transactionId': 'TXN054', 'amount': '250'},
        {'date': '2024-02-01', 'transactionId': 'TXN055', 'amount': '250'},
        {'date': '2024-03-01', 'transactionId': 'TXN056', 'amount': '300'},
        {'date': '2024-04-01', 'transactionId': 'TXN057', 'amount': '250'},
        {'date': '2024-05-01', 'transactionId': 'TXN058', 'amount': '350'},
      ],
      referenceNumber: 'REF12349',
    ),
    Loan(
      amount: 4000,
      dateApplied: '2023-06-01',
      status: 'Approved',
      dateApprovedRejected: '2023-06-05',
      interestRate: 5.5,
      deadline: '2025-06-01',
      didUserDefault: false,
      defaultDuration: 0,
      penalty: '0',
      monthsUsedToPay: 36,
      purpose: 'New Car',
      transactions: [
        {'date': '2023-07-01', 'transactionId': 'TXN059', 'amount': '200'},
        {'date': '2023-08-01', 'transactionId': 'TXN060', 'amount': '200'},
        {'date': '2023-09-01', 'transactionId': 'TXN061', 'amount': '200'},
        {'date': '2023-10-01', 'transactionId': 'TXN062', 'amount': '200'},
        {'date': '2023-11-01', 'transactionId': 'TXN063', 'amount': '200'},
        {'date': '2023-12-01', 'transactionId': 'TXN064', 'amount': '200'},
        {'date': '2024-01-01', 'transactionId': 'TXN065', 'amount': '200'},
        {'date': '2024-02-01', 'transactionId': 'TXN066', 'amount': '200'},
        {'date': '2024-03-01', 'transactionId': 'TXN067', 'amount': '200'},
        {'date': '2024-04-01', 'transactionId': 'TXN068', 'amount': '200'},
        {'date': '2024-05-01', 'transactionId': 'TXN069', 'amount': '200'},
        {'date': '2024-06-01', 'transactionId': 'TXN070', 'amount': '200'},
        {'date': '2024-07-01', 'transactionId': 'TXN071', 'amount': '200'},
        {'date': '2024-08-01', 'transactionId': 'TXN072', 'amount': '200'},
        {'date': '2024-09-01', 'transactionId': 'TXN073', 'amount': '200'},
        {'date': '2024-10-01', 'transactionId': 'TXN074', 'amount': '200'},
        {'date': '2024-11-01', 'transactionId': 'TXN075', 'amount': '200'},
        {'date': '2024-12-01', 'transactionId': 'TXN076', 'amount': '200'},
        {'date': '2025-01-01', 'transactionId': 'TXN077', 'amount': '200'},
        {'date': '2025-02-01', 'transactionId': 'TXN078', 'amount': '200'},
        {'date': '2025-03-01', 'transactionId': 'TXN079', 'amount': '200'},
        {'date': '2025-04-01', 'transactionId': 'TXN080', 'amount': '20'},
      ],
      referenceNumber: 'REF12350',
    ),
    Loan(
      amount: 5000,
      dateApplied: '2023-07-01',
      status: 'Approved',
      dateApprovedRejected: '2023-07-05',
      interestRate: 6.0,
      deadline: '2024-07-01',
      didUserDefault: true,
      defaultDuration: 30,
      penalty: '100',
      monthsUsedToPay: 12,
      purpose: 'Business',
      transactions: [
        {'date': '2023-08-01', 'transactionId': 'TXN095', 'amount': '600'},
        {'date': '2023-09-01', 'transactionId': 'TXN096', 'amount': '600'},
        {'date': '2023-10-01', 'transactionId': 'TXN097', 'amount': '600'},
        {'date': '2023-11-01', 'transactionId': 'TXN098', 'amount': '600'},
        {'date': '2023-12-01', 'transactionId': 'TXN099', 'amount': '600'},
        {'date': '2024-01-01', 'transactionId': 'TXN100', 'amount': '600'},
        {'date': '2024-02-01', 'transactionId': 'TXN101', 'amount': '600'},
        {'date': '2024-03-01', 'transactionId': 'TXN102', 'amount': '300'},
        {'date': '2024-04-01', 'transactionId': 'TXN103', 'amount': '300'},
        {'date': '2024-05-01', 'transactionId': 'TXN104', 'amount': '200'},
        {'date': '2024-06-01', 'transactionId': 'TXN105', 'amount': '200'},
        {'date': '2024-07-01', 'transactionId': 'TXN106', 'amount': '200'},
      ],
      referenceNumber: 'REF12351',
    ),
    Loan(
      amount: 7000,
      dateApplied: '2023-08-01',
      status: 'Approved',
      dateApprovedRejected: '2023-08-05',
      interestRate: 4.0,
      deadline: '2025-08-01',
      didUserDefault: true,
      defaultDuration: 60,
      penalty: '200',
      monthsUsedToPay: 36,
      purpose: 'House',
      transactions: [
        {'date': '2023-09-01', 'transactionId': 'TXN107', 'amount': '300'},
        {'date': '2023-10-01', 'transactionId': 'TXN108', 'amount': '300'},
        {'date': '2023-11-01', 'transactionId': 'TXN109', 'amount': '300'},
        {'date': '2023-12-01', 'transactionId': 'TXN110', 'amount': '300'},
        {'date': '2024-01-01', 'transactionId': 'TXN111', 'amount': '300'},
        {'date': '2024-02-01', 'transactionId': 'TXN112', 'amount': '300'},
        {'date': '2024-03-01', 'transactionId': 'TXN113', 'amount': '300'},
        {'date': '2024-04-01', 'transactionId': 'TXN114', 'amount': '300'},
        {'date': '2024-05-01', 'transactionId': 'TXN115', 'amount': '300'},
        {'date': '2024-06-01', 'transactionId': 'TXN116', 'amount': '300'},
        {'date': '2024-07-01', 'transactionId': 'TXN117', 'amount': '300'},
        {'date': '2024-08-01', 'transactionId': 'TXN118', 'amount': '300'},
        {'date': '2024-09-01', 'transactionId': 'TXN119', 'amount': '300'},
        {'date': '2024-10-01', 'transactionId': 'TXN120', 'amount': '300'},
        {'date': '2024-11-01', 'transactionId': 'TXN121', 'amount': '300'},
        {'date': '2024-12-01', 'transactionId': 'TXN122', 'amount': '300'},
        {'date': '2025-01-01', 'transactionId': 'TXN123', 'amount': '300'},
        {'date': '2025-02-01', 'transactionId': 'TXN124', 'amount': '600'},
        {'date': '2025-03-01', 'transactionId': 'TXN125', 'amount': '300'},
        {'date': '2025-04-01', 'transactionId': 'TXN126', 'amount': '300'},
        {'date': '2025-05-01', 'transactionId': 'TXN127', 'amount': '500'},
        {'date': '2025-06-01', 'transactionId': 'TXN128', 'amount': '300'},
        {'date': '2025-07-01', 'transactionId': 'TXN129', 'amount': '300'},
        {'date': '2025-08-01', 'transactionId': 'TXN130', 'amount': '80'},
      ],
      referenceNumber: 'REF12352',
    ),
    Loan(
      amount: 8000,
      dateApplied: '2023-09-01',
      status: 'Approved',
      dateApprovedRejected: '2023-09-05',
      interestRate: 4.5,
      deadline: '2026-09-01',
      didUserDefault: true,
      defaultDuration: 45,
      penalty: '300',
      monthsUsedToPay: 0,
      purpose: 'Investment',
      transactions: [
        {'date': '2023-10-01', 'transactionId': 'TXN131', 'amount': '100'},
        {'date': '2023-11-01', 'transactionId': 'TXN132', 'amount': '200'},
        {'date': '2023-12-01', 'transactionId': 'TXN133', 'amount': '300'},
      ],
      referenceNumber: 'REF12353',
      extendedDeadline: '2026-11-01',
    ),
    Loan(
      amount: 2500,
      dateApplied: '2023-10-01',
      status: 'Rejected',
      dateApprovedRejected: '2023-10-05',
      interestRate: 7.0,
      didUserDefault: false,
      defaultDuration: 0,
      penalty: '0',
      monthsUsedToPay: 0,
      purpose: 'Start a Small Business',
      transactions: [],
      rejectionReason: 'Insufficient Collateral',
      referenceNumber: 'REF12354',
    ),
    Loan(
      amount: 3500,
      dateApplied: '2023-11-01',
      status: 'Pending',
      interestRate: 6.5,
      didUserDefault: false,
      defaultDuration: 0,
      penalty: '0',
      monthsUsedToPay: 0,
      purpose: 'Travel Expenses',
      transactions: [],
      referenceNumber: 'REF12355',
    ),
  ];

  String _filterStatus = 'All';
  String _sortType = 'Newest';

  @override
  Widget build(BuildContext context) {
    List<Loan> filteredLoans = _filterStatus == 'All'
        ? loans
        : loans.where((loan) => loan.status == _filterStatus).toList();

    switch (_sortType) {
      case 'Newest':
        filteredLoans.sort((a, b) => DateTime.parse(b.dateApplied).compareTo(DateTime.parse(a.dateApplied)));
        break;
      case 'Oldest':
        filteredLoans.sort((a, b) => DateTime.parse(a.dateApplied).compareTo(DateTime.parse(b.dateApplied)));
        break;
      case 'Completed':
        filteredLoans = filteredLoans.where((loan) => loan.status == 'Approved' && loan.monthsUsedToPay > 0).toList();
        break;
      case 'Incomplete':
        filteredLoans = filteredLoans.where((loan) => loan.status == 'Approved' && loan.monthsUsedToPay == 0).toList();
        break;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 150, 135),
        title: const Text('Loan History'),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              setState(() {
                _filterStatus = value;
              });
            },
            itemBuilder: (context) => [
              const PopupMenuItem(value: 'All', child: Text('All')),
              const PopupMenuItem(value: 'Approved', child: Text('Approved')),
              const PopupMenuItem(value: 'Pending', child: Text('Pending')),
              const PopupMenuItem(value: 'Rejected', child: Text('Rejected')),
            ],
            icon: const Icon(Icons.filter_list),
          ),
          PopupMenuButton<String>(
            onSelected: (value) {
              setState(() {
                _sortType = value;
              });
            },
            itemBuilder: (context) => [
              const PopupMenuItem(value: 'Newest', child: Text('Newest')),
              const PopupMenuItem(value: 'Oldest', child: Text('Oldest')),
              const PopupMenuItem(value: 'Completed', child: Text('Completed')),
              const PopupMenuItem(value: 'Incomplete', child: Text('Incomplete')),
            ],
            icon: const Icon(Icons.sort),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Your Loan History',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Scrollbar(
                child: ListView.builder(
                  itemCount: filteredLoans.length,
                  itemBuilder: (context, index) {
                    final loan = filteredLoans[index];
                    return InkWell(
                      onTap: () => _showLoanDetailsDialog(context, loan),
                      child: LoanCard(loan: loan),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showLoanDetailsDialog(BuildContext context, Loan loan) {
    final bool isApproved = loan.status == 'Approved';
    final bool isIncomplete = isApproved && loan.monthsUsedToPay == 0;
    final bool isCompleted = loan.monthsUsedToPay > 0 && isApproved;
    final double interestAmount = (loan.amount * loan.interestRate) / 100;
    final double totalTransactions = loan.transactions.fold(0, (sum, transaction) {
      return sum + double.tryParse(transaction['amount']!)!;
    });
    final double totalLoanAndPenalty = loan.amount + interestAmount + (loan.penalty != 'None' ? double.parse(loan.penalty) : 0);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Loan Details - Ȼ${loan.amount}'),
          content: SizedBox(
            width: double.maxFinite,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Reference Number: ${loan.referenceNumber}'),
                  Text('Date of Application: ${loan.dateApplied}'),
                  Text('Status: ${loan.status}'),
                  if (isApproved) ...[
                    Text('Date of Approval: ${loan.dateApprovedRejected}'),
                    Text('Interest Rate: ${loan.interestRate}%'),
                    Text('Interest Amount: Ȼ$interestAmount'),
                    Text('Deadline: ${loan.deadline}'),
                    if (loan.didUserDefault)
                      Text('Extended Deadline: ${loan.extendedDeadline}'),
                    Text('Default Issues: ${loan.didUserDefault ? 'Yes, for ${loan.defaultDuration} days, Penalty: ${loan.penalty}' : 'None'}'),
                    Text('Months Used to Fully Pay: ${loan.monthsUsedToPay > 0 ? loan.monthsUsedToPay : 'Not available yet'}'),
                    const SizedBox(height: 10),
                    const Text('Amount Expected to Pay:', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('Ȼ$totalLoanAndPenalty'),
                    const SizedBox(height: 10),
                    const Text('Purpose:', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(loan.purpose),
                    const SizedBox(height: 10),
                    const Text('Money Paid Back:', style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 100,
                      child: Scrollbar(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: loan.transactions.length,
                          itemBuilder: (context, index) {
                            final transaction = loan.transactions[index];
                            return Text('${transaction['date']}: ${transaction['transactionId']} - Ȼ${transaction['amount']}');
                          },
                        ),
                      ),
                    ),
                    Text('Total Amount Paid Back: Ȼ$totalTransactions'),
                    if (isIncomplete) const Text('State: Incomplete', style: TextStyle(fontSize: 16)),
                    if (isCompleted) const Text('State: Completed', style: TextStyle(fontSize: 16)),
                  ],
                  if (loan.status == 'Rejected') ...[
                    Text('Date of Rejection: ${loan.dateApprovedRejected}'),
                    Text('Rejection Reason: ${loan.rejectionReason}'),
                    const SizedBox(height: 10),
                    const Text('Purpose:', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(loan.purpose),
                  ],
                ],
              ),
            ),
          ),
          actions: [
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

class LoanCard extends StatelessWidget {
  final Loan loan;

  const LoanCard({super.key, required this.loan});

  @override
  Widget build(BuildContext context) {
    final bool isIncomplete = loan.status == 'Approved' && loan.monthsUsedToPay == 0;
    final bool isCompleted = loan.monthsUsedToPay > 0 && loan.status == 'Approved';

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Amount: Ȼ${loan.amount}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text(
              'Reference Number: ${loan.referenceNumber}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 5),
            Text(
              'Purpose: ${loan.purpose}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 5),
            Text(
              'Status: ${loan.status}',
              style: TextStyle(
                fontSize: 16,
                color: _getStatusColor(loan.status),
              ),
            ),
            const SizedBox(height: 5),
            if (isIncomplete) const Text('State: Incomplete', style: TextStyle(fontSize: 16)),
            if (isCompleted) const Text('State: Completed', style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'Approved':
        return Colors.green;
      case 'Pending':
        return Colors.orange;
      case 'Rejected':
        return Colors.red;
      default:
        return Colors.black;
    }
  }
}
