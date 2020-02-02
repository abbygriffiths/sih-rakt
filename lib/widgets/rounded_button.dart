import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  RoundedButton({@required this.onPressed, this.child, this.color = Colors.red, this.borderColor = Colors.white, this.padding});

  Function onPressed;
  Widget child;
  Color color, borderColor;
  EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      color: this.color,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: this.borderColor)),
      child: this.child,
      onPressed: this.onPressed,
      padding: this.padding,
    );
  }
}
