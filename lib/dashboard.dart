import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  @override
  State<DashboardPage> createState() => _DasboardPageState();
}

class _DasboardPageState extends State<DashboardPage> {
  var _credits = 352;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        elevation: 0,
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.all(7.5),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(
                Icons.person, 
                color: Colors.red
              )
            ),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('$_credits',
              style: TextStyle(fontSize: 72, color: Colors.redAccent)
            ),
            Text('credits',
              style: TextStyle(fontSize: 20)
            ),
            Row()
          ],
        )
      ),
    );
  }
}
