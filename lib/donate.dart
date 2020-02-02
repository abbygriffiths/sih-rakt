import 'package:flutter/material.dart';

import 'widgets/rounded_button.dart';
import 'widgets/text_field_decoration.dart';

class DonatePage extends StatefulWidget {
  @override
  _DonatePageState createState() => _DonatePageState();
}

class _DonatePageState extends State<StatefulWidget> {
  final _districts = ['Bhopal', 'Sehore', 'Indore', 'Mumbai', 'Thane'];
  var _district = 'Bhopal';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Donate')),
      body: Center(
          child: Column(children: <Widget>[
        Padding(
          padding: new EdgeInsets.all(20),
        ),
        Container(
          padding: new EdgeInsets.symmetric(horizontal: 30),
          child: TextField(
            decoration:
                textFieldDecoration(labelText: 'Name', color: Colors.black54),
          ),
        ),
        Padding(
          padding: new EdgeInsets.all(20),
        ),
        Container(
          padding: new EdgeInsets.symmetric(horizontal: 30),
          child: TextField(
            obscureText: true,
            decoration:
                textFieldDecoration(labelText: 'Name', color: Colors.black54),
          ),
        ),
        DropdownButton(
            items: _districts.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                _district = value;
              });
            },
            value: _district),
        RoundedButton(
          onPressed: () {
            // Scaffold.of(context).showSnackBar(SnackBar(content: Text('Your request has been noted. We will get back soon')));
            Navigator.of(context).popAndPushNamed('/dashboard');
          },
          color: Colors.redAccent,
          child: Text(
            'Donate',
            style: new TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ])),
    );
  }
}
