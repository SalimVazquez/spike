import 'package:flutter/material.dart';
import 'src/pages/login.dart';

void main() {
  runApp(MaterialApp(
    title: 'Spike',
    theme: ThemeData(primaryColor: Color.fromRGBO(38, 193, 101, 1)),
    initialRoute: '/',
    routes: {
      '/': (context) => Login(),
    },
  ));
}
