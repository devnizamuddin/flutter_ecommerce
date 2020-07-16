


import 'package:flutter/material.dart';

class ProductInfo extends StatelessWidget {

  final prod_name;
  final prod_picture;
  final old_price;
  final price;

  ProductInfo(this.prod_name, this.prod_picture, this.old_price, this.price);

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 300,
      child: GridTile(
        child: Container(
          color: Colors.white,
          child: Image.asset(prod_picture),
        ),
        footer: Container(
          color: Colors.white70,
          child: ListTile(
            leading: Text(
              prod_name,
              style:
              TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            title: Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    "\$${old_price}",
                    style: TextStyle(
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough),
                  ),
                ),
                Expanded(
                  child: Text(
                    "\$${price}",
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
