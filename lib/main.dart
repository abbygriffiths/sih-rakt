import 'package:flutter/material.dart';

import 'register.dart';
import 'dashboard.dart';
import 'login.dart';
import 'donate.dart';

void main() => runApp(RaktApp());

class RaktApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RaKT',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/dashboard': (context) => DashboardPage(),
        '/donate': (context) => DonatePage(),
        '/request': (context) => DonatePage(),
        '/register': (context) => RegisterPage()
      }
    );
  }
}
