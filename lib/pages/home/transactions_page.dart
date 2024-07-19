import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionsPage extends StatefulWidget {
  const TransactionsPage({super.key});

  @override
  _TransactionsPageState createState() => _TransactionsPageState();
}

class _TransactionsPageState extends State<TransactionsPage> {
  String _filterType = 'All';
  String _searchQuery = '';
  String _selectedCategory = 'All';
  DateTimeRange? _dateRange;
  final TextEditingController _searchController = TextEditingController();

  final List<Map<String, String>> transactions = [
    {'title': 'Loan Approved', 'date': '2024-07-01', 'amount': 'GHS 5000.00', 'type': 'received', 'category': 'Income'},
    {'title': 'Groceries', 'date': '2024-07-02', 'amount': 'GHS 200.00', 'type': 'spent', 'category': 'Food'},
    {'title': 'Utilities', 'date': '2024-07-03', 'amount': 'GHS 150.00', 'type': 'spent', 'category': 'Utilities'},
    {'title': 'Loan Payment', 'date': '2024-07-04', 'amount': 'GHS 1000.00', 'type': 'spent', 'category': 'Debt'},
    {'title': 'Gift Received', 'date': '2024-07-05', 'amount': 'GHS 300.00', 'type': 'received', 'category': 'Gift'},
    {'title': 'Restaurant', 'date': '2024-07-06', 'amount': 'GHS 100.00', 'type': 'spent', 'category': 'Food'},
    {'title': 'Salary', 'date': '2024-07-07', 'amount': 'GHS 1500.00', 'type': 'received', 'category': 'Income'},
    {'title': 'Internet Bill', 'date': '2024-07-08', 'amount': 'GHS 80.00', 'type': 'spent', 'category': 'Utilities'},
    {'title': 'Gym Membership', 'date': '2024-07-09', 'amount': 'GHS 60.00', 'type': 'spent', 'category': 'Health'},
    {'title': 'Freelance Payment', 'date': '2024-07-10', 'amount': 'GHS 400.00', 'type': 'received', 'category': 'Income'},
    {'title': 'Movie Night', 'date': '2024-07-11', 'amount': 'GHS 50.00', 'type': 'spent', 'category': 'Entertainment'},
    {'title': 'Water Bill', 'date': '2024-07-12', 'amount': 'GHS 30.00', 'type': 'spent', 'category': 'Utilities'},
    // Add the loan transactions here{'title': 'Loan Payment', 'date': '2023-02-01', 'amount': 'Ȼ100.00', 'type': 'spent', 'category': 'Debt'},
    {'title': 'Loan Payment', 'date': '2023-03-01', 'amount': 'Ȼ200.00', 'type': 'spent', 'category': 'Debt'},
    {'title': 'Loan Payment', 'date': '2023-04-01', 'amount': 'Ȼ10.00', 'type': 'spent', 'category': 'Debt'},
    {'title': 'Loan Payment', 'date': '2023-05-01', 'amount': 'Ȼ90.00', 'type': 'spent', 'category': 'Debt'},
    {'title': 'Loan Payment', 'date': '2023-06-01', 'amount': 'Ȼ100.00', 'type': 'spent', 'category': 'Debt'},
    {'title': 'Loan Payment', 'date': '2023-07-01', 'amount': 'Ȼ300.00', 'type': 'spent', 'category': 'Debt'},
    {'title': 'Loan Payment', 'date': '2023-08-01', 'amount': 'Ȼ20.00', 'type': 'spent', 'category': 'Debt'},
    {'title': 'Loan Payment', 'date': '2023-09-01', 'amount': 'Ȼ20.00', 'type': 'spent', 'category': 'Debt'},
    {'title': 'Loan Payment', 'date': '2023-10-01', 'amount': 'Ȼ150.00', 'type': 'spent', 'category': 'Debt'},
    {'title': 'Loan Payment', 'date': '2023-11-01', 'amount': 'Ȼ20.00', 'type': 'spent', 'category': 'Debt'},
    {'title': 'Loan Payment', 'date': '2023-12-01', 'amount': 'Ȼ35.00', 'type': 'spent', 'category': 'Debt'},
    {'title': 'Loan Payment', 'date': '2024-01-01', 'amount': 'Ȼ10.00', 'type': 'spent', 'category': 'Debt'},
    {'title': 'Loan Payment', 'date': '2023-05-01', 'amount': 'Ȼ500.00', 'type': 'spent', 'category': 'Debt'},
    {'title': 'Loan Payment', 'date': '2023-06-01', 'amount': 'Ȼ200.00', 'type': 'spent', 'category': 'Debt'},
    {'title': 'Loan Payment', 'date': '2024-09-01', 'amount': 'Ȼ200.00', 'type': 'spent', 'category': 'Debt'},
    {'title': 'Loan Payment', 'date': '2025-12-01', 'amount': 'Ȼ100.00', 'type': 'spent', 'category': 'Debt'},
    {'title': 'Loan Payment', 'date': '2026-01-01', 'amount': 'Ȼ1000.00', 'type': 'spent', 'category': 'Debt'},
    {'title': 'Loan Payment', 'date': '2026-02-01', 'amount': 'Ȼ600.00', 'type': 'spent', 'category': 'Debt'},
    {'title': 'Loan Payment', 'date': '2026-02-01', 'amount': 'Ȼ12.50', 'type': 'spent', 'category': 'Debt'},
    {'title': 'Loan Payment', 'date': '2023-06-01', 'amount': 'Ȼ250.00', 'type': 'spent', 'category': 'Debt'},
    {'title': 'Loan Payment', 'date': '2023-07-01', 'amount': 'Ȼ250.00', 'type': 'spent', 'category': 'Debt'},
    {'title': 'Loan Payment', 'date': '2023-08-01', 'amount': 'Ȼ250.00', 'type': 'spent', 'category': 'Debt'},
    {'title': 'Loan Payment', 'date': '2023-09-01', 'amount': 'Ȼ250.00', 'type': 'spent', 'category': 'Debt'},
    {'title': 'Loan Payment', 'date': '2023-10-01', 'amount': 'Ȼ250.00', 'type': 'spent', 'category': 'Debt'},
    {'title': 'Loan Payment', 'date': '2023-11-01', 'amount': 'Ȼ250.00', 'type': 'spent', 'category': 'Debt'},
    {'title': 'Loan Payment', 'date': '2023-12-01', 'amount': 'Ȼ250.00', 'type': 'spent', 'category': 'Debt'},
    {'title': 'Loan Payment', 'date': '2024-01-01', 'amount': 'Ȼ250.00', 'type': 'spent', 'category': 'Debt'},
    {'title': 'Loan Payment', 'date': '2024-02-01', 'amount': 'Ȼ250.00', 'type': 'spent', 'category': 'Debt'},
    {'title': 'Loan Payment', 'date': '2024-03-01', 'amount': 'Ȼ300.00', 'type': 'spent', 'category': 'Debt'},
    {'title': 'Loan Payment', 'date': '2024-04-01', 'amount': 'Ȼ250.00', 'type': 'spent', 'category': 'Debt'},
    {'title': 'Loan Payment', 'date': '2024-05-01', 'amount': 'Ȼ350.00', 'type': 'spent', 'category': 'Debt'},
    {'title': 'Loan Payment', 'date': '2023-07-01', 'amount': 'Ȼ200.00', 'type': 'spent', 'category': 'Debt'},
    {'title': 'Loan Payment', 'date': '2023-08-01', 'amount': 'Ȼ200.00', 'type': 'spent', 'category': 'Debt'},
    {'title': 'Loan Payment', 'date': '2023-09-01', 'amount': 'Ȼ200.00', 'type': 'spent', 'category': 'Debt'},
    {'title': 'Loan Payment', 'date': '2023-10-01', 'amount': 'Ȼ200.00', 'type': 'spent', 'category': 'Debt'},
    {'title': 'Loan Payment', 'date': '2023-11-01', 'amount': 'Ȼ200.00', 'type': 'spent', 'category': 'Debt'},
    {'title': 'Loan Payment', 'date': '2023-12-01', 'amount': 'Ȼ200.00', 'type': 'spent', 'category': 'Debt'},
    {'title': 'Loan Payment', 'date': '2024-01-01', 'amount': 'Ȼ200.00', 'type': 'spent', 'category': 'Debt'},
    {'title': 'Loan Payment', 'date': '2024-02-01', 'amount': 'Ȼ200.00', 'type': 'spent', 'category': 'Debt'},
    {'title': 'Loan Payment', 'date': '2024-03-01', 'amount': 'Ȼ200.00', 'type': 'spent', 'category': 'Debt'},
    {'title': 'Loan Payment', 'date': '2024-04-01', 'amount': 'Ȼ200.00', 'type': 'spent', 'category': 'Debt'},
    {'title': 'Loan Payment', 'date': '2024-05-01', 'amount': 'Ȼ200.00', 'type': 'spent', 'category': 'Debt'},
    {'title': 'Loan Payment', 'date': '2024-06-01', 'amount': 'Ȼ200.00', 'type': 'spent', 'category': 'Debt'},
    {'title': 'Loan Payment', 'date': '2024-07-01', 'amount': 'Ȼ200.00', 'type': 'spent', 'category': 'Debt'},
    {'title': 'Loan Payment', 'date': '2024-08-01', 'amount': 'Ȼ200.00', 'type': 'spent', 'category': 'Debt'},
    {'title': 'Loan Payment', 'date': '2024-09-01', 'amount': 'Ȼ200.00', 'type': 'spent', 'category': 'Debt'},
    {'title': 'Loan Payment', 'date': '2024-10-01', 'amount': 'Ȼ200.00', 'type': 'spent', 'category': 'Debt'},
    {'title': 'Loan Payment', 'date': '2024-11-01', 'amount': 'Ȼ200.00', 'type': 'spent', 'category': 'Debt'},
    {'title': 'Loan Payment', 'date': '2024-12-01', 'amount': 'Ȼ200.00', 'type': 'spent', 'category': 'Debt'},
    {'title': 'Loan Payment', 'date': '2025-01-01', 'amount': 'Ȼ200.00', 'type': 'spent', 'category': 'Debt'},
    {'title': 'Loan Payment', 'date': '2025-02-01', 'amount': 'Ȼ200.00', 'type': 'spent', 'category': 'Debt'},
    {'title': 'Loan Payment', 'date': '2025-03-01', 'amount': 'Ȼ200.00', 'type': 'spent', 'category': 'Debt'},
    {'title': 'Loan Payment', 'date': '2025-04-01', 'amount': 'Ȼ20.00', 'type': 'spent', 'category': 'Debt'},
    {'title': 'Loan Payment', 'date': '2023-08-01', 'amount': 'Ȼ600.00', 'type': 'spent', 'category': 'Debt'},
    {'title': 'Loan Payment', 'date': '2023-09-01', 'amount': 'Ȼ600.00', 'type': 'spent', 'category': 'Debt'},
    {'title': 'Loan Payment', 'date': '2023-10-01', 'amount': 'Ȼ600.00', 'type': 'spent', 'category': 'Debt'},
    {'title': 'Loan Payment', 'date': '2023-11-01', 'amount': 'Ȼ600.00', 'type': 'spent', 'category': 'Debt'},
    {'title': 'Loan Payment', 'date': '2023-12-01', 'amount': 'Ȼ600.00', 'type': 'spent', 'category': 'Debt'},
    {'title': 'Loan Payment', 'date': '2024-01-01', 'amount': 'Ȼ600.00', 'type': 'spent', 'category': 'Debt'},
    {'title': 'Loan Payment', 'date': '2024-02-01', 'amount': 'Ȼ600.00', 'type': 'spent', 'category': 'Debt'},
    {'title': 'Loan Payment', 'date': '2024-03-01', 'amount': 'Ȼ300.00', 'type': 'spent', 'category': 'Debt'},
    {'title': 'Loan Payment', 'date': '2024-04-01', 'amount': 'Ȼ300.00', 'type': 'spent', 'category': 'Debt'},
    {'title': 'Loan Payment', 'date': '2024-05-01', 'amount': 'Ȼ200.00', 'type': 'spent', 'category': 'Debt'},
    {'title': 'Loan Payment', 'date': '2024-06-01', 'amount': 'Ȼ200.00', 'type': 'spent', 'category': 'Debt'},
    {'title': 'Loan Payment', 'date': '2024-07-01', 'amount': 'Ȼ200.00', 'type': 'spent', 'category': 'Debt'},
    {'title': 'Loan Payment', 'date': '2023-09-01', 'amount': 'Ȼ300.00', 'type': 'spent', 'category': 'Debt'},
    {'title': 'Loan Payment', 'date': '2023-10-01', 'amount': 'Ȼ300.00', 'type': 'spent', 'category': 'Debt'},
    {'title': 'Loan Payment', 'date': '2023-11-01', 'amount': 'Ȼ300.00', 'type': 'spent', 'category': 'Debt'},
    {'title': 'Loan Payment', 'date': '2023-12-01', 'amount': 'Ȼ300.00', 'type': 'spent', 'category': 'Debt'},
    {'title': 'Loan Payment', 'date': '2024-01-01', 'amount': 'Ȼ300.00', 'type': 'spent', 'category': 'Debt'},
    {'title': 'Loan Payment', 'date': '2024-02-01', 'amount': 'Ȼ300.00', 'type': 'spent', 'category': 'Debt'},
    {'title': 'Loan Payment', 'date': '2024-03-01', 'amount': 'Ȼ300.00', 'type': 'spent', 'category': 'Debt'},
    {'title': 'Loan Payment', 'date': '2024-04-01', 'amount': 'Ȼ300.00', 'type': 'spent', 'category': 'Debt'},
    {'title': 'Loan Payment', 'date': '2024-05-01', 'amount': 'Ȼ300.00', 'type': 'spent', 'category': 'Debt'},
    {'title': 'Loan Payment', 'date': '2024-06-01', 'amount': 'Ȼ300.00', 'type': 'spent', 'category': 'Debt'},
    {'title': 'Loan Payment', 'date': '2024-07-01', 'amount': 'Ȼ300.00', 'type': 'spent', 'category': 'Debt'},
    {'title': 'Loan Payment', 'date': '2024-08-01', 'amount': 'Ȼ300.00', 'type': 'spent', 'category': 'Debt'},
    {'title': 'Loan Payment', 'date': '2024-09-01', 'amount': 'Ȼ300.00', 'type': 'spent', 'category': 'Debt'},
    {'title': 'Loan Payment', 'date': '2024-10-01', 'amount': 'Ȼ300.00', 'type': 'spent', 'category': 'Debt'},
    {'title': 'Loan Payment', 'date': '2024-11-01', 'amount': 'Ȼ300.00', 'type': 'spent', 'category': 'Debt'},
    {'title': 'Loan Payment', 'date': '2024-12-01', 'amount': 'Ȼ300.00', 'type': 'spent', 'category': 'Debt'},
    {'title': 'Loan Payment', 'date': '2025-01-01', 'amount': 'Ȼ300.00', 'type': 'spent', 'category': 'Debt'},
    {'title': 'Loan Payment', 'date': '2025-02-01', 'amount': 'Ȼ600.00', 'type': 'spent', 'category': 'Debt'},
    {'title': 'Loan Payment', 'date': '2025-03-01', 'amount': 'Ȼ300.00', 'type': 'spent', 'category': 'Debt'},
    {'title': 'Loan Payment', 'date': '2025-04-01', 'amount': 'Ȼ300.00', 'type': 'spent', 'category': 'Debt'},
    {'title': 'Loan Payment', 'date': '2025-05-01', 'amount': 'Ȼ500.00', 'type': 'spent', 'category': 'Debt'},
    {'title': 'Loan Payment', 'date': '2025-06-01', 'amount': 'Ȼ300.00', 'type': 'spent', 'category': 'Debt'},
    {'title': 'Loan Payment', 'date': '2025-07-01', 'amount': 'Ȼ300.00', 'type': 'spent', 'category': 'Debt'},
    {'title': 'Loan Payment', 'date': '2025-08-01', 'amount': 'Ȼ80.00', 'type': 'spent', 'category': 'Debt'},
    {'title': 'Loan Payment', 'date': '2023-10-01', 'amount': 'Ȼ100.00', 'type': 'spent', 'category': 'Debt'},
    {'title': 'Loan Payment', 'date': '2023-11-01', 'amount': 'Ȼ200.00', 'type': 'spent', 'category': 'Debt'},
    {'title': 'Loan Payment', 'date': '2023-12-01', 'amount': 'Ȼ300.00', 'type': 'spent', 'category': 'Debt'},

  
  ];


  List<Map<String, String>> get _filteredTransactions {
    return transactions.where((transaction) {
      final matchesFilterType = _filterType == 'All' || transaction['type'] == _filterType.toLowerCase();
      final matchesCategory = _selectedCategory == 'All' || transaction['category'] == _selectedCategory;
      final matchesSearchQuery = transaction['title']!.toLowerCase().contains(_searchQuery.toLowerCase());
      final matchesDateRange = _dateRange == null ||
          (DateTime.parse(transaction['date']!).isAfter(_dateRange!.start) &&
              DateTime.parse(transaction['date']!).isBefore(_dateRange!.end.add(const Duration(days: 1))));
      return matchesFilterType && matchesCategory && matchesSearchQuery && matchesDateRange;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transactions'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  controller: _searchController,
                  onChanged: (value) {
                    setState(() {
                      _searchQuery = value;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: 'Search Transactions',
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: _searchQuery.isNotEmpty
                        ? IconButton(
                            icon: const Icon(Icons.clear),
                            onPressed: () {
                              setState(() {
                                _searchQuery = '';
                                _searchController.clear();
                              });
                            },
                          )
                        : null,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    PopupMenuButton<String>(
                      onSelected: (String value) {
                        setState(() {
                          _filterType = value;
                        });
                      },
                      itemBuilder: (BuildContext context) {
                        return ['All', 'Received', 'Spent'].map((String choice) {
                          return PopupMenuItem<String>(
                            value: choice,
                            child: Text(choice),
                          );
                        }).toList();
                      },
                      icon: const Icon(Icons.filter_list),
                    ),
                    PopupMenuButton<String>(
                      onSelected: (String value) {
                        setState(() {
                          _selectedCategory = value;
                        });
                      },
                      itemBuilder: (BuildContext context) {
                        return ['All', 'Income', 'Food', 'Utilities', 'Debt', 'Gift', 'Health', 'Entertainment'].map((String choice) {
                          return PopupMenuItem<String>(
                            value: choice,
                            child: Text(choice),
                          );
                        }).toList();
                      },
                      icon: const Icon(Icons.category),
                    ),
                    IconButton(
                      icon: const Icon(Icons.date_range),
                      onPressed: () async {
                        final DateTimeRange? picked = await showDateRangePicker(
                          context: context,
                          firstDate: DateTime(2020),
                          lastDate: DateTime(2030),
                        );
                        if (picked != null && picked != _dateRange) {
                          setState(() {
                            _dateRange = picked;
                          });
                        }
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: _filteredTransactions.length,
              itemBuilder: (context, index) {
                final transaction = _filteredTransactions[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    title: Text(
                      transaction['title']!,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    subtitle: Text(DateFormat('yyyy-MM-dd').format(DateTime.parse(transaction['date']!))),
                    trailing: Text(
                      transaction['amount']!,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: transaction['type'] == 'received' ? Colors.green : Colors.red,
                      ),
                    ),
                    onTap: () {
                      _showTransactionDetails(context, transaction);
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showTransactionDetails(BuildContext context, Map<String, String> transaction) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('${transaction['title']} Details'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Date: ${transaction['date']}'),
            const SizedBox(height: 8),
            Text('Amount: ${transaction['amount']}'),
            const SizedBox(height: 8),
            Text('Type: ${transaction['type']}'),
            const SizedBox(height: 8),
            Text('Category: ${transaction['category']}'),
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
