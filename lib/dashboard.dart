import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  @override
  State<DashboardPage> createState() => _DasboardPageState();
}

class _DasboardPageState extends State<DashboardPage> {
  var _credits = 352;

  FlatButton _roundedButton(text, Function function, invertedColor) {
    Color bgColor = invertedColor ? Colors.white : Colors.red;
    Color borderColor = invertedColor ? Colors.redAccent : Colors.white;

    return FlatButton(
        color: bgColor,
        shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(20),
            side: BorderSide(color: borderColor)),
        child: Text(text, style: TextStyle(color: borderColor)),
        padding: EdgeInsets.symmetric(horizontal: 10),
        onPressed: () {
          Navigator.of(context).pushNamed('/donate');
        });
  }

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
                child: Icon(Icons.person, color: Colors.red)),
          )
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('$_credits',
                    style: TextStyle(fontSize: 72, color: Colors.redAccent)),
                Text('credits', style: TextStyle(fontSize: 20)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    _roundedButton('Donate', () {
                      Navigator.of(context).pushNamed('/donate');
                    }, false),
                    _roundedButton('Request', () {
                      Navigator.of(context).pushNamed('/request');
                    }, true),
                  ],
                )
              ],
      ))),
    );
  }
}
