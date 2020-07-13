

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.red,
        title: Text('FlashApp'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search),onPressed: (){},)
        ],

      ),

    );
  }
}
