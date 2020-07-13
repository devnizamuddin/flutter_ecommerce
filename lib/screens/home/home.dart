import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/screens/home/categories.dart';
import 'package:flutter_ecommerce/screens/navigation/navigation.dart';
import 'package:carousel_pro/carousel_pro.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Widget image_carousel = Container(
    height: 200.0,
    child: Carousel(
      boxFit: BoxFit.cover,
      images: [
        AssetImage('images/cone.jpg'),
        AssetImage('images/ctwo.jpeg'),
        AssetImage('images/wone.jpeg'),
        AssetImage('images/wtwo.jpeg'),
        AssetImage('images/wfour.jpeg'),
      ],
      animationCurve: Curves.fastOutSlowIn,
      autoplay: false,
      animationDuration: Duration(milliseconds: 1000),
      dotSize: 4.0,
      indicatorBgPadding: 2.0,
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Colors.red,
        title: Text('Ecommarce for App'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {},
          )
        ],
      ),
      drawer: MyNavigation(),
      body: ListView(
        children: <Widget>[
          image_carousel

          ,Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Category'),
          )

          ,Categories()
        ],
      )
    );
  }
}
