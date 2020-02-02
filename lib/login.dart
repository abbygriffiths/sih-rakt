import 'package:flutter/material.dart';

import 'widgets/rounded_button.dart';
import 'widgets/text_field_decoration.dart';

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
            LoginField(
              labelText: 'Username',
              isPassword: false,
            ),
            Padding(
              padding: new EdgeInsets.all(20),
            ),
            LoginField(
              labelText: 'Password',
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
                padding: new EdgeInsets.all(30),
                child: RoundedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/dashboard');
                    },
                    color: Colors.redAccent,
                    child: Text(
                      'Sign In',
                      style: new TextStyle(color: Colors.white, fontSize: 20),
                    )))
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

class LoginField extends StatelessWidget {
  LoginField({@required this.labelText, @required this.isPassword, Key key})
      : super(key: key);
  final String labelText;
  final bool isPassword;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: new EdgeInsets.symmetric(horizontal: 30),
      child: TextFormField(
        decoration: textFieldDecoration(labelText: labelText, color: Colors.black54 ),
        obscureText: isPassword,
      ),
    );
  }
}
