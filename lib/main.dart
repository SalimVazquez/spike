import 'package:flutter/material.dart';
import 'src/pages/login.dart';
import 'src/pages/register.dart';
import 'src/pages/user/dashboard.dart';
import 'src/pages/user/formUser.dart';
import 'src/pages/user/listUser.dart';
import 'src/pages/user/profile.dart';
//import 'src/pages/user/update.dart';

void main() {
  runApp(MaterialApp(
    title: 'Spike',
    theme: ThemeData(primaryColor: Color.fromRGBO(38, 193, 101, 1)),
    initialRoute: '/',
    routes: {
      '/': (context) => Login(),
      '/register': (context) => Register(),
      '/dashboard': (context) => Dashboard(),
      '/form': (context) => FormUser(),
      '/list': (context) => List(),
      '/profile': (context) => Profile(),
    },
  ));
}
