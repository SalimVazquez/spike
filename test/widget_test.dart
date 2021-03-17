// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:spike/src/pages/login.dart';

import '../lib/src/pages/register.dart';
import '../lib/src/pages/user/dashboard.dart';
import '../lib/src/pages/user/update.dart';

Widget testWidgetLogin = new MediaQuery(
    data: new MediaQueryData(),
    child: new MaterialApp(
      home: Login(),
    ));

Widget testWidgetRegister = new MediaQuery(
    data: new MediaQueryData(),
    child: new MaterialApp(
      home: Register(),
    ));
    
Widget testWidgetUpdate = new MediaQuery(
    data: new MediaQueryData(),
    child: new MaterialApp(
      home: Update(),
    ));

Widget testWidgetDashboard = new MediaQuery(
    data: new MediaQueryData(),
    child: new MaterialApp(
      home: Dashboard(),
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

  group('Register Widget Test', () {
    testWidgets('Sing Up', (WidgetTester tester) async {
      await tester.pumpWidget(testWidgetRegister);
      expect(find.text('Sing Up'), findsOneWidget);
    });
    testWidgets('Submit', (WidgetTester tester) async {
      await tester.pumpWidget(testWidgetRegister);
      expect(find.text('Submit'), findsOneWidget);
    });
    testWidgets('Please enter your email', (WidgetTester tester) async {
      await tester.pumpWidget(testWidgetRegister);
      expect(find.text('Please enter your email'), findsOneWidget);
    });
    testWidgets('Please enter your password', (WidgetTester tester) async {
      await tester.pumpWidget(testWidgetRegister);
      expect(find.text('Please enter your password'), findsOneWidget);
    });
    testWidgets('Please confirm your password', (WidgetTester tester) async {
      await tester.pumpWidget(testWidgetRegister);
      expect(find.text('Please confirm your password'), findsOneWidget);
    });
  });

  
  group('Update Widget Test', () {
    testWidgets('Hi, Admin!', (WidgetTester tester) async {
      await tester.pumpWidget(testWidgetUpdate);
      expect(find.text('Hi, Admin!'), findsOneWidget);
    });
    testWidgets('Edit my profile', (WidgetTester tester) async {
      await tester.pumpWidget(testWidgetUpdate);
      expect(find.text('Edit my profile'), findsOneWidget);
    });
    testWidgets('Update my profile', (WidgetTester tester) async {
      await tester.pumpWidget(testWidgetUpdate);
      expect(find.text('Update my profile'), findsOneWidget);
    });
  });
  
  group('Dashboard Widget Test', () {
    testWidgets('Dashboard', (WidgetTester tester) async {
      await tester.pumpWidget(testWidgetDashboard);
      expect(find.text('Dashboard'), findsOneWidget);
    });
    testWidgets('Hi, Admin!', (WidgetTester tester) async {
      await tester.pumpWidget(testWidgetDashboard);
      expect(find.text('Hi, Admin!'), findsOneWidget);
    });
    testWidgets('Edit my profile', (WidgetTester tester) async {
      await tester.pumpWidget(testWidgetDashboard);
      expect(find.text('Edit my profile'), findsOneWidget);
    });
    testWidgets('Age', (WidgetTester tester) async {
      await tester.pumpWidget(testWidgetDashboard);
      expect(find.text('Age'), findsOneWidget);
    });
    testWidgets('Email', (WidgetTester tester) async {
      await tester.pumpWidget(testWidgetDashboard);
      expect(find.text('Email'), findsOneWidget);
    });
  });
}
