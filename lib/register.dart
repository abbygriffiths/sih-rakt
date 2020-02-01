import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              padding: new EdgeInsets.only(top: 100),
              child: Logo(),
            ),
            Padding(
              padding: new EdgeInsets.only(top: 50),
            ),
            RegistrationForm(),
            // Container(
            //   padding: new EdgeInsets.symmetric(horizontal: 30, vertical: 5),
            //   child: TextField(
            //     decoration: new InputDecoration(
            //       hintText: 'Name',
            //     ),
            //   ),
            // ),
            // Container(
            //   padding: new EdgeInsets.symmetric(horizontal: 30, vertical: 5),
            //   child: TextField(
            //     decoration: new InputDecoration(hintText: 'Address'),
            //   ),
            // ),
            // Container(
            //   padding: new EdgeInsets.symmetric(horizontal: 30, vertical: 5),
            //   child: TextFormField(
            //     keyboardType: TextInputType.emailAddress,
            //     decoration: new InputDecoration(hintText: 'E-Mail ID'),
            //   ),
            // ),
            // Container(
            //   padding: new EdgeInsets.symmetric(horizontal: 30, vertical: 5),
            //   child: TextFormField(
            //     keyboardType: TextInputType.datetime,
            //     decoration: new InputDecoration(hintText: 'Date Of Birth'),
            //   ),
            // ),
            // Container(
            //   padding: new EdgeInsets.symmetric(horizontal: 30, vertical: 5),
            //   child: TextField(
            //     decoration: new InputDecoration(hintText: 'District'),
            //   ),
            // ),
            // Container(
            //   padding: new EdgeInsets.symmetric(horizontal: 30, vertical: 5),
            //   child: TextField(
            //     decoration: new InputDecoration(hintText: 'Nationality'),
            //   ),
            // ),
            // Container(
            //   padding: new EdgeInsets.symmetric(horizontal: 30, vertical: 5),
            //   child: TextField(
            //     decoration: new InputDecoration(
            //         hintText: 'Serious Medical Condition(s), if any'),
            //   ),
            // ),
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
          padding: new EdgeInsets.symmetric(horizontal: 30),
          child: new TextFormField(
              decoration: const InputDecoration(labelText: 'Name'),
              keyboardType: TextInputType.text,
              validator: validateName,
              onSaved: (String val) {
                _name = val;
              }),
        ),
        Container(
          padding: new EdgeInsets.symmetric(horizontal: 30),
          child: new TextFormField(
              decoration: const InputDecoration(labelText: 'Mobile'),
              keyboardType: TextInputType.phone,
              validator: validateMobile,
              onSaved: (String val) {
                _mobile = val;
              }),
        ),
        Container(
          padding: new EdgeInsets.symmetric(horizontal: 30),
          child: new TextFormField(
            decoration: const InputDecoration(
              labelText: 'Email',
            ),
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
                borderRadius: new BorderRadius.circular(20),side: new BorderSide(color: Colors.redAccent)),
            child: Text('Date Of Birth', style: new TextStyle(color: Colors.redAccent),),
            onPressed: () {
              DatePicker.showDatePicker(context,
                  showTitleActions: true,
                  minTime: DateTime(1970, 01, 01),
                  maxTime: DateTime.now(), onChanged: (date) {
                print('$date');
              });
            },
          ),
        ),
        new SizedBox(
          height: 30.0,
        ),
        FlatButton(
            color: Colors.redAccent,
            shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(20),
                side: BorderSide(color: Colors.white)),
            child: Text('Register', style: TextStyle(color: Colors.white)),
            padding: EdgeInsets.symmetric(horizontal: 10),
            onPressed: () {
              if (_validateInputs()) {
                Navigator.of(context).pushNamed('/donate');
              }
            }),
      ],
    );
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
