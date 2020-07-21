import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'file:///D:/FlutterApp/flutter_ecommerce/flutter_ecommerce/lib/screens/cart/cart.dart';
import 'package:flutter_ecommerce/screens/home/categories.dart';
import 'package:flutter_ecommerce/screens/home/products.dart';
import 'package:flutter_ecommerce/screens/navigation/navigation.dart';
import 'package:carousel_pro/carousel_pro.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  //Image Slider

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
      dotBgColor: Colors.transparent,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          centerTitle: true,
          backgroundColor: Colors.red,
          title: Text('Ecommerce'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.shopping_cart,),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> Cart()));
              },
            )
          ],
        ),
        drawer: MyNavigation(),
        body: Column(
          children: <Widget>[
            //image slider
            image_carousel,
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Category'),
            )

            //Type of product
            ,
            Categories(),

            Padding(
              padding: EdgeInsets.fromLTRB(8.0, 8.0, 0.0, 8.0),
              child: Text('Recent Product'),
            ),
            //Grid View of product

            Flexible(child: Products())
          ],
        ));
  }
}
