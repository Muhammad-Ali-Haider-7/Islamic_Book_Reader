// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:islamic_book_reader/main.dart';

void main() {
  testWidgets('Add more Button Present', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // // is on home page
    // expect(find.text('تسنیم القرآن'), findsOneWidget);

    // Verify that button is Available or not.
    // expect(find.text('Add More'), findsOneWidget);

    // await tester.tap(find.text('Add more'));
    // await tester.pumpAndSettle();

    // expect(find.text("مزید کتب شامل کریں"), findsOneWidget);
  
  });
}
