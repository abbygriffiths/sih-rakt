import 'package:flutter/material.dart';

InputDecoration textFieldDecoration({hintText}) {
  return InputDecoration(
    hintText: hintText,
    enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
      color: Colors.redAccent,
    )),
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
      color: Colors.redAccent,
    )),
  );
}
