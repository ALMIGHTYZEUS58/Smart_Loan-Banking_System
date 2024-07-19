import 'package:flutter_test/flutter_test.dart';
import 'package:fast_funds/main.dart'; // Ensure this import is correct

void main() {
  testWidgets('App starts at LoginPage', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that the app starts on the LoginPage.
    expect(find.text('Login'), findsOneWidget);
  });
}
