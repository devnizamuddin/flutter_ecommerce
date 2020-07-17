import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/screens/cart/cart_products.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Colors.red,
        title: Text('Cart'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.card_travel),
            onPressed: () {},
          ),
        ],
      ),

      body: CartProduct(),

      bottomNavigationBar: Row(
        children: <Widget>[
          Expanded(
            child: ListTile(
              title: Text('Total'),
              subtitle: Text('\$390'),
            ),
          ),
          Expanded(
            child: MaterialButton(
              onPressed: () {},
              child: Text('Checkout', style: TextStyle(color: Colors.white),),
              color:Colors.red,
            ),
          ),

        ],
      ),
    );
  }
}
