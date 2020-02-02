import 'package:flutter/material.dart';

InputDecoration textFieldDecoration({labelText, color}) {
  return InputDecoration(
    hintText: labelText,
    enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
      color: color,
    )),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: color,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: color,
      ),
    ),
  );
}
