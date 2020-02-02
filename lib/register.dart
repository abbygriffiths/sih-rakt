import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sih_rakt/widgets/text_field_decoration.dart';

import 'widgets/rounded_button.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                padding: new EdgeInsets.only(top: 80, bottom: 50),
                child: Logo(),
              ),
              RegistrationForm(),
            ],
          ),
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

class RegistrationForm extends StatefulWidget {
  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  String _name;
  String _email;
  String _mobile;
  int _radioValue = 0;

  String _district = 'Sehore';

  final _districts = ['Sehore', 'Bhopal', 'Indore', 'Mumbai', 'Thane'];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Form(
        key: _formKey,
        autovalidate: _autoValidate,
        child: FormUI(),
      ),
    );
  }

// Here is our Form UI
  Widget FormUI() {
    return new Column(
      children: <Widget>[
        Container(
          padding: new EdgeInsets.symmetric(horizontal: 30, vertical: 5),
          child: new TextFormField(
              decoration:
                  textFieldDecoration(labelText: 'Name', color: Colors.black54),
              keyboardType: TextInputType.text,
              validator: validateName,
              onSaved: (String val) {
                _name = val;
              }),
        ),
        Container(
          padding: new EdgeInsets.symmetric(horizontal: 30, vertical: 5),
          child: new TextFormField(
              decoration: textFieldDecoration(
                  labelText: 'Mobile', color: Colors.black54),
              keyboardType: TextInputType.phone,
              validator: validateMobile,
              onSaved: (String val) {
                _mobile = val;
              }),
        ),
        Container(
          padding: new EdgeInsets.symmetric(
            horizontal: 30, vertical: 5
          ),
          child: new TextFormField(
            decoration:
                textFieldDecoration(labelText: 'Email', color: Colors.black54),
            keyboardType: TextInputType.emailAddress,
            validator: validateEmail,
            onSaved: (String val) {
              _email = val;
            },
          ),
        ),
        Container(
          padding: new EdgeInsets.symmetric(horizontal: 30),
          child: FlatButton(
            shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(20),
                side: new BorderSide(color: Colors.redAccent)),
            child: Text(
              'Date Of Birth',
              style: new TextStyle(color: Colors.redAccent),
            ),
            onPressed: () {
              DatePicker.showDatePicker(context,
                  showTitleActions: true,
                  minTime: DateTime(1920, 01, 01),
                  maxTime: DateTime.now(),
                  onChanged: (date) {});
            },
          ),
        ),
        Container(
          padding: new EdgeInsets.symmetric(horizontal: 30, vertical: 5),
          child: TextFormField(
            decoration: textFieldDecoration(
                labelText: 'Address', color: Colors.black54),
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
        Container(
          padding: new EdgeInsets.symmetric(horizontal: 30, vertical: 5),
          child: TextFormField(
            keyboardType: TextInputType.number,
            decoration: textFieldDecoration(
                labelText: 'PinCode', color: Colors.black54),
          ),
        ),
        Container(
          padding: new EdgeInsets.symmetric(horizontal: 30, vertical: 5),
          child: TextFormField(
            decoration: textFieldDecoration(
                labelText: 'Nationality', color: Colors.black54),
          ),
        ),
        Container(
          padding: new EdgeInsets.symmetric(horizontal: 30, vertical: 5),
          child: TextFormField(
            decoration: textFieldDecoration(
                labelText: 'Serious Medical Condition(s), if any',
                color: Colors.black54),
          ),
        ),
        Container(
          padding: new EdgeInsets.symmetric(horizontal: 30),
          child: Row(children: <Widget>[
            new Text('Gender:'),
            SizedBox(
              width: 20,
            ),
            new Radio(
              value: 0,
              onChanged: _handleRadioValueChange,
              groupValue: _radioValue,
              activeColor: Colors.redAccent,
            ),
            Text('Male'),
            SizedBox(
              width: 80,
            ),
            new Radio(
              value: 1,
              groupValue: _radioValue,
              onChanged: _handleRadioValueChange,
              activeColor: Colors.redAccent,
            ),
            Text('Female'),
          ]),
        ),
        new SizedBox(
          height: 30.0,
        ),
        Container(
          padding: new EdgeInsets.only(bottom: 30),
          child: RoundedButton(
              color: Colors.redAccent,
              child: Text('Register', style: TextStyle(color: Colors.white)),
              padding: EdgeInsets.symmetric(horizontal: 10),
              borderColor: Colors.white,
              onPressed: () {
                if (_validateInputs()) {
                  Navigator.of(context).pushNamed('/dashboard');
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text('Registered')));
                }
              }),
        ),
      ],
    );
  }

  void _handleRadioValueChange(int value) {
    setState(() {
      _radioValue = value;
    });
  }

  bool _validateInputs() {
    if (_formKey.currentState.validate()) {
//    If all data are correct then save data to out variables
      _formKey.currentState.save();
      return true;
    } else {
//    If all data are not valid then start auto validation.
      setState(() {
        _autoValidate = true;
      });
      return false;
    }
  }
}

String validateName(String value) {
  if (value.length < 3)
    return 'Name must be more than 2 charater';
  else
    return null;
}

String validateMobile(String value) {
// Indian Mobile number are of 10 digit only
  if (value.length != 10)
    return 'Mobile Number must be of 10 digit';
  else
    return null;
}

String validateEmail(String value) {
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = new RegExp(pattern);
  if (!regex.hasMatch(value))
    return 'Enter Valid Email';
  else
    return null;
}
