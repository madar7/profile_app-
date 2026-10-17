import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:profile_app/main.dart';

void main() {
  testWidgets('Profile app renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: ProfilePage()));

    // Verify the name is rendered
    expect(find.text('ibroz Hassan'), findsOneWidget);

    // Verify the job title is rendered
    expect(find.text('Mobile Developer'), findsOneWidget);
  });
}
