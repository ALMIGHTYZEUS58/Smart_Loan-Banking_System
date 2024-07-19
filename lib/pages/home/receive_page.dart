import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ReceivePage extends StatefulWidget {
  const ReceivePage({super.key});

  @override
  _ReceivePageState createState() => _ReceivePageState();
}

class _ReceivePageState extends State<ReceivePage> {
  final TextEditingController senderNameController = TextEditingController();
  final TextEditingController mobileNumberController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final TextEditingController purposeController = TextEditingController();
  final TextEditingController referenceController = TextEditingController();
  final TextEditingController bankAccountNumberController = TextEditingController();
  final TextEditingController fastFundsUserIdController = TextEditingController();
  String? selectedBank;
  String? selectedNetwork;
  String scannedData = '';

  @override
  void dispose() {
    senderNameController.dispose();
    mobileNumberController.dispose();
    amountController.dispose();
    purposeController.dispose();
    referenceController.dispose();
    bankAccountNumberController.dispose();
    fastFundsUserIdController.dispose();
    super.dispose();
  }

  void _showReceiveDetails(String option) {
    // Clear all previous input fields when a new option is selected
    senderNameController.clear();
    mobileNumberController.clear();
    amountController.clear();
    purposeController.clear();
    referenceController.clear();
    bankAccountNumberController.clear();
    fastFundsUserIdController.clear();
    selectedBank = null;
    selectedNetwork = null;
    scannedData = '';

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Enter $option Details',
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  if (option == 'Mobile Money') _buildMobileMoneyForm(),
                  if (option == 'Bank Transfer') _buildBankTransferForm(),
                  if (option == 'Fast Fund User') _buildFastFundsForm(),
                  if (option == 'Receive with QR Code') _buildReceiveWithQRCodeForm(),
                  if (option == 'Receive Bills') _buildReceiveBillsForm(),
                  const SizedBox(height: 16),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle form submission and authentication
                        _showVerificationDialog(option);
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'Submit',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildMobileMoneyForm() {
    return Column(
      children: [
        _buildDropdownField('Select Network Provider', ['MTN', 'Telecel', 'AirtelTigo'], (value) {
          setState(() {
            selectedNetwork = value;
          });
        }),
        const SizedBox(height: 16),
        _buildTextField('Sender Name', senderNameController),
        const SizedBox(height: 16),
        _buildTextField('Mobile Number', mobileNumberController),
        const SizedBox(height: 16),
        _buildTextField('Amount', amountController),
        const SizedBox(height: 16),
        _buildTextField('Purpose', purposeController),
        const SizedBox(height: 16),
        _buildTextField('Reference', referenceController),
      ],
    );
  }

  Widget _buildBankTransferForm() {
    return Column(
      children: [
        _buildDropdownField('Select Bank', ['GCB Bank', 'ADB Bank', 'Zenith Bank', 'CalBank'], (value) {
          setState(() {
            selectedBank = value;
          });
        }),
        const SizedBox(height: 16),
        _buildTextField('Sender Name', senderNameController),
        const SizedBox(height: 16),
        _buildTextField('Account Number', bankAccountNumberController),
        const SizedBox(height: 16),
        _buildTextField('Amount', amountController),
        const SizedBox(height: 16),
        _buildTextField('Purpose', purposeController),
        const SizedBox(height: 16),
        _buildTextField('Reference', referenceController),
      ],
    );
  }

  Widget _buildFastFundsForm() {
    return Column(
      children: [
        _buildTextField('Fast Funds User ID', fastFundsUserIdController),
        const SizedBox(height: 16),
        _buildTextField('Sender Name', senderNameController),
        const SizedBox(height: 16),
        _buildTextField('Amount', amountController),
        const SizedBox(height: 16),
        _buildTextField('Purpose', purposeController),
        const SizedBox(height: 16),
        _buildTextField('Reference', referenceController),
      ],
    );
  }

  Widget _buildReceiveWithQRCodeForm() {
    return Column(
      children: [
        Center(
          child: ElevatedButton.icon(
            onPressed: () => _scanQRCode(context),
            icon: const Icon(Icons.qr_code_scanner),
            label: const Text('Scan QR Code'),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        if (scannedData.isNotEmpty) _buildTextField('Scanned Data', TextEditingController(text: scannedData), readOnly: true),
        const SizedBox(height: 16),
        _buildTextField('Amount', amountController),
        const SizedBox(height: 16),
        _buildTextField('Purpose', purposeController),
        const SizedBox(height: 16),
        _buildTextField('Reference', referenceController),
      ],
    );
  }

  Widget _buildReceiveBillsForm() {
    return Column(
      children: [
        _buildTextField('Bill Provider ID', fastFundsUserIdController),
        const SizedBox(height: 16),
        _buildTextField('Amount', amountController),
        const SizedBox(height: 16),
        _buildTextField('Purpose', purposeController),
        const SizedBox(height: 16),
        _buildTextField('Reference', referenceController),
      ],
    );
  }

  Widget _buildDropdownField(String label, List<String> items, ValueChanged<String?> onChanged) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      value: selectedBank,
      onChanged: onChanged,
      items: items.map((item) {
        return DropdownMenuItem(
          value: item,
          child: Text(item),
        );
      }).toList(),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller, {bool readOnly = false}) {
    return TextFormField(
      controller: controller,
      readOnly: readOnly,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }

  Future<void> _scanQRCode(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const QRViewExample()),
    );

    if (result != null) {
      setState(() {
        scannedData = result;
      });
    }
  }

  void _showVerificationDialog(String option) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Verify Details'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Sender Name: ${senderNameController.text}'),
              const SizedBox(height: 8),
              Text('Amount: ${amountController.text}'),
              const SizedBox(height: 8),
              Text('Purpose: ${purposeController.text}'),
              const SizedBox(height: 8),
              Text('Reference: ${referenceController.text}'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                _showSuccessDialog();
              },
              child: const Text('Confirm'),
            ),
          ],
        );
      },
    );
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Transaction Successful'),
          content: const Text('Your transaction has been completed successfully.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context); // Close the transaction details modal
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 150, 135),
        title: const Text('Receive Money'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            _buildReceiveOption(context, 'Fast Fund User', Icons.person, 'Fast Fund User'),
            const SizedBox(height: 16),
            _buildReceiveOption(context, 'Mobile Money', Icons.phone_android, 'Mobile Money'),
            const SizedBox(height: 16),
            _buildReceiveOption(context, 'Bank Transfer', Icons.account_balance, 'Bank Transfer'),
            const SizedBox(height: 16),
            _buildReceiveOption(context, 'Receive with QR Code', Icons.qr_code_scanner, 'Receive with QR Code'),
            const SizedBox(height: 16),
            _buildReceiveOption(context, 'Receive Bills', Icons.receipt, 'Receive Bills'),
          ],
        ),
      ),
    );
  }

  Widget _buildReceiveOption(BuildContext context, String title, IconData icon, String option) {
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
        onPressed: () => _showReceiveDetails(option),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 0,
        ),
        child: Row(
          children: [
            Icon(icon, size: 40, color: const Color.fromARGB(255, 0, 150, 135)),
            const SizedBox(width: 20),
            Text(
              title,
              style: const TextStyle(fontSize: 18, color: Color.fromARGB(255, 0, 150, 135)),
            ),
          ],
        ),
      ),
    );
  }
}

class QRViewExample extends StatefulWidget {
  const QRViewExample({super.key});

  @override
  _QRViewExampleState createState() => _QRViewExampleState();
}

class _QRViewExampleState extends State<QRViewExample> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  String scannedData = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Scan QR Code')),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  if (controller != null) {
                    controller!.pauseCamera();
                    Navigator.pop(context, scannedData);
                  }
                },
                child: const Text('Finish Scanning'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });

    controller.scannedDataStream.listen((scanData) {
      setState(() {
        scannedData = scanData.code!;
        controller.pauseCamera();
        Navigator.pop(context, scannedData);
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
