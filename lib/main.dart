import 'package:flutter/material.dart';
import 'src/pages/login.dart';
import 'src/pages/register.dart';
import 'src/pages/user/dashboard.dart';
import 'src/pages/user/update.dart';

void main() {
  runApp(MaterialApp(
    routes: {
      '/': (context) => TestingApp(),
    },
  ));
}

class TestingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MaterialApp(
        title: 'Spike',
        theme: ThemeData(primaryColor: Color.fromRGBO(38, 193, 101, 1)),
        initialRoute: '/',
        routes: {
          '/': (context) => Login(),
          '/register': (context) => Register(),
          '/dashboard': (context) => Dashboard(),
          '/update': (context) => Update(),
        },
      ),
    );
  }
}
