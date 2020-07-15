import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var product_list = [
    {
      'name': 'Blazer',
      'picture': 'images/products/blazer1.jpeg',
      'old_price': '500',
      'price': '400'
    },
    {
      'name': 'Red Dress',
      'picture': 'images/products/dress1.jpeg',
      'old_price': '1000',
      'price': '900'
    }
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: product_list.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (BuildContext context, int index) {
          return SingleProduct(
              product_list[index]['name'],
              product_list[index]['picture'],
              product_list[index]['old_price'],
              product_list[index]['price']);
        });
  }
}

class SingleProduct extends StatelessWidget {
  final prod_name;
  final prod_picture;
  final old_price;
  final price;

  SingleProduct(this.prod_name, this.prod_picture, this.old_price, this.price);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
        tag: prod_name,
        child: Material(
          child: InkWell(
            onTap: () {},
            child: GridTile(
              footer: Container(
                color: Colors.white70,
                child: ListTile(
                  leading: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        prod_name,
                        style: TextStyle(fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  title: Text(
                    "\$$price",
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.w800,),
                    textAlign: TextAlign.center,
                  ),
                  subtitle: Text(
                    "\$$old_price",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w800,decoration: TextDecoration.lineThrough),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              child: Image.asset(
                prod_picture,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
