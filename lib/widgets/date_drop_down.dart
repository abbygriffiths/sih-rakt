import 'package:flutter/material.dart';

class DateField extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DateFieldState();
}

class _DateFieldState extends State<StatefulWidget> {
  int _day = 1;
  final _days = List<int>.generate(31, (i) => i + 1);

  int _month = 1;
  final _months = List<int>.generate(12, (i) => i + 1);

  int _year = 2020;
  final _years = List<int>.generate(100, (i) => i - 1);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          DropdownButton(
            items: _getItems(_days),
            value: _day,
            onChanged: (value) {},
            isExpanded: true,
          ),
          DropdownButton(
            items: _getItems(_months),
            value: _month,
            onChanged: (value) {},
            isExpanded: true,
          ),
          // DropdownButton(
          //   items: _getItems(_years),
          //   value: _year,
          //   onChanged: (value) {},
          //   isExpanded: true,
          // ),
        ],
      ),
    );
  }

  List<DropdownMenuItem<int>> _getItems(List<int> list) {
    return list.map((i) {
      return DropdownMenuItem(child: Text(i.toString()), value: i);
    }).toList();
  }
}
