import 'package:flutter/material.dart';

import 'register.dart';
import 'dashboard.dart';
import 'login.dart';
import 'donate.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
