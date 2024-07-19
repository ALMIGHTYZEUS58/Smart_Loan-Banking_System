import 'package:flutter/material.dart';
import '../../models/loan.dart';

class RequestLoanPage extends StatefulWidget {
  const RequestLoanPage({super.key});

  @override
  RequestLoanPageState createState() => RequestLoanPageState();
}

class RequestLoanPageState extends State<RequestLoanPage> {
  final _formKey = GlobalKey<FormState>();

  // Mock data retrieved from the system
  final Map<String, String> userProfile = {
    'fullName': 'John Doe',
    'dob': '1990-01-01',
    'address': '123 Main St, Accra',
    'phone': '+233-123-456-789',
    'email': 'john.doe@example.com',
    'ghanaCardNumber': 'GHA-1234567890',
    'employerName': 'ABC Corp',
    'jobTitle': 'Software Developer',
    'employmentStatus': 'Full-time',
    'lengthOfEmployment': '5 years',
    'employerAddress': '456 Business Rd, Accra',
    'employerPhone': '+233-987-654-321',
    'monthlyIncome': '5000',
    'otherIncome': '200',
    'housingPayment': '1000',
    'monthlyDebt': '500',
    'assets': '20000',
    'liabilities': '10000',
    'creditScore': '750',
    'bankStatements': 'Link to bank statements',
    'taxReturns': 'Link to tax returns',
    'payStubs': 'Link to pay stubs',
    'identification': 'Link to ID',
  };

  final TextEditingController _loanAmountController = TextEditingController();
  final TextEditingController _loanPurposeController = TextEditingController();
  final TextEditingController _loanTermController = TextEditingController();
  final TextEditingController _collateralController = TextEditingController();

  final List<double> _interestRates = [4.5, 5.0, 5.5, 6.0];
  double _selectedInterestRate = 4.5;

  List<Loan> loans = [];

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final loanDetails = {
        'fullName': userProfile['fullName'],
        'dob': userProfile['dob'],
        'address': userProfile['address'],
        'phone': userProfile['phone'],
        'email': userProfile['email'],
        'ghanaCardNumber': userProfile['ghanaCardNumber'],
        'employerName': userProfile['employerName'],
        'jobTitle': userProfile['jobTitle'],
        'employmentStatus': userProfile['employmentStatus'],
        'lengthOfEmployment': userProfile['lengthOfEmployment'],
        'employerAddress': userProfile['employerAddress'],
        'employerPhone': userProfile['employerPhone'],
        'monthlyIncome': double.parse(userProfile['monthlyIncome']!),
        'otherIncome': double.parse(userProfile['otherIncome']!),
        'housingPayment': double.parse(userProfile['housingPayment']!),
        'monthlyDebt': double.parse(userProfile['monthlyDebt']!),
        'assets': userProfile['assets'],
        'liabilities': userProfile['liabilities'],
        'loanAmount': double.parse(_loanAmountController.text),
        'loanPurpose': _loanPurposeController.text,
        'loanTerm': _loanTermController.text,
        'interestRate': _selectedInterestRate,
        'collateral': _collateralController.text,
        'creditScore': userProfile['creditScore'],
        'bankStatements': userProfile['bankStatements'],
        'taxReturns': userProfile['taxReturns'],
        'payStubs': userProfile['payStubs'],
        'identification': userProfile['identification'],
      };

      // Add loan to history as pending
      setState(() {
        Loan newLoan = Loan(
          amount: loanDetails['loanAmount'] as double,
          dateApplied: DateTime.now().toIso8601String(),
          status: 'Pending',
          interestRate: loanDetails['interestRate'] as double,
          purpose: loanDetails['loanPurpose'] as String,
          collateral: loanDetails['collateral'] as String?,
          transactions: [],
          referenceNumber: 'REF${DateTime.now().millisecondsSinceEpoch}',
        );
        loans.add(newLoan);
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Loan Request Submitted')),
      );

      // Refresh the form
      _formKey.currentState!.reset();
      _loanAmountController.clear();
      _loanPurposeController.clear();
      _loanTermController.clear();
      _collateralController.clear();
      _selectedInterestRate = 4.5;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Request Loan'),
        backgroundColor: const Color.fromARGB(255, 0, 150, 135),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Loan Request Form',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _loanAmountController,
                  decoration: InputDecoration(
                    labelText: 'Loan Amount (GHS)',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the loan amount';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _loanPurposeController,
                  decoration: InputDecoration(
                    labelText: 'Purpose of Loan',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the purpose of the loan';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _loanTermController,
                  decoration: InputDecoration(
                    labelText: 'Loan Term (Duration in months)',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the loan term';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                DropdownButtonFormField<double>(
                  value: _selectedInterestRate,
                  decoration: InputDecoration(
                    labelText: 'Interest Rate (%)',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  items: _interestRates
                      .map((rate) => DropdownMenuItem(
                            value: rate,
                            child: Text('$rate%'),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedInterestRate = value!;
                    });
                  },
                  validator: (value) {
                    if (value == null) {
                      return 'Please select an interest rate';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _collateralController,
                  decoration: InputDecoration(
                    labelText: 'Collateral (if any)',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: _submitForm,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 0, 150, 135),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 50,
                        vertical: 15,
                      ),
                      textStyle: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    child: const Text('Submit Loan Request'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
