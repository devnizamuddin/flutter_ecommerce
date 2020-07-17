import 'package:flutter/material.dart';
import 'file:///D:/FlutterApp/flutter_ecommerce/flutter_ecommerce/lib/screens/cart/cart.dart';

class MyNavigation extends StatefulWidget {
  @override
  _MyNavigationState createState() => _MyNavigationState();
}

class _MyNavigationState extends State<MyNavigation> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          // User Account information

          UserAccountsDrawerHeader(
            accountName: Text('Nizam Uddin Shamrat'),
            accountEmail: Text('nshamrat7@gmail.com'),
            currentAccountPicture: GestureDetector(
              child: CircleAvatar(
                child: Icon(
                  Icons.person,
                  color: Colors.red,
                ),
                backgroundColor: Colors.grey,
              ),
            ),
            decoration: BoxDecoration(color: Colors.red),
          ),

          // Drawer Menu

          InkWell(
            onTap: () {},
            child: ListTile(
              title: Text('Home'),
              leading: Icon(
                Icons.home,
                color: Colors.red,
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: ListTile(
              title: Text('My account'),
              leading: Icon(
                Icons.person,
                color: Colors.red,
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: ListTile(
              title: Text('My order'),
              leading: Icon(
                Icons.shopping_basket,
                color: Colors.red,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Cart()));
            },
            child: ListTile(
              title: Text('Shopping card'),
              leading: Icon(
                Icons.shopping_cart,
                color: Colors.red,
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: ListTile(
              title: Text('Favorites'),
              leading: Icon(
                Icons.favorite,
                color: Colors.red,
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: ListTile(
              title: Text('Setting'),
              leading: Icon(
                Icons.settings,
                color: Colors.blue,
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: ListTile(
              title: Text('About'),
              leading: Icon(
                Icons.help,
                color: Colors.green,
              ),
            ),
          )
        ],
      ),
    );
  }
}
