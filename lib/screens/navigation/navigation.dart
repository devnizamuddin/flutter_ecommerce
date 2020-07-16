


import 'package:flutter/material.dart';

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
                child: Icon(Icons.person, color: Colors.red,),
                backgroundColor: Colors.grey,
              ),
            ),
            decoration: BoxDecoration(color: Colors.red),
          ),


          // Drawer Menu

          InkWell(
            onTap: (){},

            child: ListTile(
              title: Text('Home'),
              leading: Icon(Icons.home,),
            ),
          ),
          InkWell(
            onTap: (){},

            child: ListTile(
              title: Text('My account'),
              leading: Icon(Icons.person,),
            ),
          ),
          InkWell(
            onTap: (){},

            child: ListTile(
              title: Text('My order'),
              leading: Icon(Icons.shopping_basket,),
            ),
          ),
          InkWell(
            onTap: (){},

            child: ListTile(
              title: Text('Categories'),
              leading: Icon(Icons.dashboard,),
            ),
          ),
          InkWell(
            onTap: (){},

            child: ListTile(
              title: Text('Favorites'),
              leading: Icon(Icons.favorite,),
            ),
          )
          ,InkWell(
            onTap: (){},

            child: ListTile(
              title: Text('Setting'),
              leading: Icon(Icons.settings,color: Colors.blue,),
            ),
          ),
          InkWell(
            onTap: (){},

            child: ListTile(
              title: Text('About'),
              leading: Icon(Icons.help,color: Colors.green,),
            ),
          )

        ],
      ),
    );
  }
}
