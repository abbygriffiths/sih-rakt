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
            Logo(),
            Padding(
              padding: new EdgeInsets.all(20),
            ),
            LoginFields(
              hinttext: 'Username',
              isPassword: false,
            ),
            Padding(
              padding: new EdgeInsets.all(20),
            ),
            LoginFields(
              hinttext: 'Password',
              isPassword: true,
            ),
            Container(
              child: FlatButton(
                child: Text(
                  'Not a member? Sign Up!',
                  style: new TextStyle(color: Colors.black),
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed('/register');
                },
              ),
            ),
            Container(
              width: 100,
              padding: new EdgeInsets.all(30),
              child: FlatButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/dashboard');
                },
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(20),
                    side: new BorderSide(color: Colors.redAccent)),
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

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
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
      ],
    );
  }
}

class LoginFields extends StatelessWidget {
  LoginFields({@required this.hinttext, @required this.isPassword, Key key})
      : super(key: key);
  final String hinttext;
  final bool isPassword;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: new EdgeInsets.symmetric(horizontal: 30),
      child: TextField(
        decoration: new InputDecoration(hintText: hinttext),
        obscureText: isPassword,
      ),
    );
  }
}
