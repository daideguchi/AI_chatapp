import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:chat_app/main.dart';

void main() {
  testWidgets('Chat App smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that the chat list screen is shown.
    expect(find.text('Chat List'), findsOneWidget);
  });
}
