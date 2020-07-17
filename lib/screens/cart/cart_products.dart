import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/screens/cart/single_cart_product.dart';

class CartProduct extends StatefulWidget {
  @override
  _CartProductState createState() => _CartProductState();
}

class _CartProductState extends State<CartProduct> {
  var product_list = [
    {
      'name': 'Blazer',
      'picture': 'images/products/blazer1.jpeg',
      'old_price': '500',
      'price': '400',
      'size': 'M',
      'color': 'Red',
      'quantity': 1
    },
    {
      'name': 'Red Dress',
      'picture': 'images/products/dress1.jpeg',
      'old_price': '500',
      'price': '400',
      'size': 'M',
      'color': 'Red',
      'quantity': 1
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: product_list.length,
        itemBuilder: (context, index) {
          return SingleCartProduct(
            product_list[index]['name'],
            product_list[index]['picture'],
            product_list[index]['price'],
            product_list[index]['size'],
            product_list[index]['color'],
            product_list[index]['quantity'],
          );
        });
  }
}
