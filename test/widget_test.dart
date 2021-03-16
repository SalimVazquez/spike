// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:spike/src/pages/login.dart';

Widget testWidgetLogin = new MediaQuery(
    data: new MediaQueryData(),
    child: new MaterialApp(
      home: Login(),
    ));

void main() {
  group('Home Page Login Widget Test', () {
    testWidgets('Sing in', (WidgetTester tester) async {
      await tester.pumpWidget(testWidgetLogin);
      expect(find.text('Sing In'), findsOneWidget);
    });
    testWidgets('Submit', (WidgetTester tester) async {
      await tester.pumpWidget(testWidgetLogin);
      expect(find.text('Submit'), findsOneWidget);
    });
    testWidgets('Create an account', (WidgetTester tester) async {
      await tester.pumpWidget(testWidgetLogin);
      expect(find.text('Create an account'), findsOneWidget);
    });
  });
}
