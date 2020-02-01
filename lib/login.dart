import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              RotatedBox(
                quarterTurns: 2,
                child: Icon(
                  Icons.place,
                  size: 54,
                  color: Colors.red,
                ),
              ),
              Text(
                'RaKT',
                style: new TextStyle(fontSize: 54),
              ),
            ]),
            Padding(
              padding: new EdgeInsets.all(20),
            ),
            Container(
              padding: new EdgeInsets.symmetric(horizontal: 30),
              child: TextField(
                decoration: new InputDecoration(hintText: 'Username'),
              ),
            ),
            Padding(
              padding: new EdgeInsets.all(20),
            ),
            Container(
              padding: new EdgeInsets.symmetric(horizontal: 30),
              child: TextField(
                obscureText: true,
                decoration: new InputDecoration(
                  hintText: 'Password',
                ),
              ),
            ),
            Container(
              child: FlatButton(
                child: Text(
                  'Not a member? Sign Up!',
                  style: new TextStyle(color: Colors.black),
                ),
                onPressed: () {},
              ),
            ),
            Container(
              padding: new EdgeInsets.all(30),
              child: MaterialButton(
                onPressed: () {},
                elevation: 8,
                height: 50,
                minWidth: MediaQuery.of(context).size.width,
                color: Colors.redAccent,
                child: Text(
                  'Sign In',
                  style: new TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
