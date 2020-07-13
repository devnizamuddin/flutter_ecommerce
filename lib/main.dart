import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      home: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
    children: <Widget>[
      Text('New World'),
      Text('Hello World'),
      Text('Hello World')
    ],
  )));
}
