import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  @override
  State<DashboardPage> createState() => _DasboardPageState();
}

class _DasboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard')
      )
    );
  }
}

