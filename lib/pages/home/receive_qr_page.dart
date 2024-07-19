import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:screenshot/screenshot.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:share_plus/share_plus.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';

class ReceiveQrPage extends StatefulWidget {
  final String userName;
  final String accountNumber;

  const ReceiveQrPage({
    super.key,
    required this.userName,
    required this.accountNumber,
  });

  @override
  _ReceiveQrPageState createState() => _ReceiveQrPageState();
}

class _ReceiveQrPageState extends State<ReceiveQrPage> {
  final ScreenshotController screenshotController = ScreenshotController();
  List<Color> selectedColors = [Colors.white, Colors.white];

  @override
  void initState() {
    super.initState();
    _loadTheme();
  }

  void changeColors(List<Color> colors) {
    setState(() {
      selectedColors = colors;
    });
    _saveTheme(colors);
  }

  void openColorPicker() {
    List<Color> tempColors = List.from(selectedColors);
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Select Background Colors'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                BlockPicker(
                  pickerColor: tempColors[0],
                  onColorChanged: (color) {
                    tempColors[0] = color;
                  },
                ),
                const SizedBox(height: 10),
                BlockPicker(
                  pickerColor: tempColors.length > 1 ? tempColors[1] : tempColors[0],
                  onColorChanged: (color) {
                    if (tempColors.length < 2) {
                      tempColors.add(color);
                    } else {
                      tempColors[1] = color;
                    }
                  },
                ),
              ],
            ),
          ),
          actions: [
            ElevatedButton(
              child: const Text('Done'),
              onPressed: () {
                changeColors(tempColors);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _saveTheme(List<Color> colors) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('color1', colors[0].value);
    await prefs.setInt('color2', colors[1].value);
  }

  Future<void> _loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedColors = [
        Color(prefs.getInt('color1') ?? Colors.white.value),
        Color(prefs.getInt('color2') ?? Colors.white.value),
      ];
    });
  }

  Future<String?> saveQrCode() async {
    final image = await screenshotController.capture();
    if (image != null) {
      final result = await ImageGallerySaver.saveImage(Uint8List.fromList(image));
      if (result['isSuccess']) {
        return result['filePath'];
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final String qrData = 'UserName:${widget.userName};AccountNumber:${widget.accountNumber}';
    final Gradient gradient = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: selectedColors,
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 150, 135),
        title: const Text('Receive via QR Code'),
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () async {
              final imagePath = await saveQrCode();
              if (imagePath != null) {
                Share.shareXFiles([XFile(imagePath)], text: 'QR Code for ${widget.userName}');
              }
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: gradient,
        ),
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const SizedBox(height: 60), // Increased padding above the profile picture
                CircleAvatar(
                  radius: 60, // Increased size of the profile picture
                  backgroundColor: Colors.teal.shade100,
                  child: ClipOval(
                    child: Image.asset(
                      'assets/profile_pic.jpg', // Path to your profile picture
                      fit: BoxFit.cover,
                      width: 120,
                      height: 120,
                    ),
                  ),
                ),
                const SizedBox(height: 20), // Padding below the profile picture
                Text(
                  widget.userName,
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Account Number: ${widget.accountNumber}',
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 20), // Padding between the profile details and QR code
                Screenshot(
                  controller: screenshotController,
                  child: Container(
                    color: Colors.white,
                    padding: const EdgeInsets.all(20.0),
                    child: QrImageView(
                      data: qrData,
                      version: QrVersions.auto,
                      size: 300.0, // Increased size of the QR code
                      embeddedImage: const AssetImage('assets/icon.png'),
                      embeddedImageStyle: const QrEmbeddedImageStyle(
                        size: Size(60, 60),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Scan the QR code to pay to me',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/scan');
                    },
                    child: const Text('Scan'),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: openColorPicker,
                    child: const Text('Change Theme'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
