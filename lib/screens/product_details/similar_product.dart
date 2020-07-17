import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/screens/product_details/product_details.dart';

class SimilarProduct extends StatefulWidget {
  var product_list = [
    {
      'name': 'Hills',
      'picture': 'images/products/hills1.jpeg',
      'old_price': '1000',
      'price': '900'
    },
    {
      'name': 'Pants',
      'picture': 'images/products/pants1.jpg',
      'old_price': '1000',
      'price': '900'
    },
    {
      'name': 'Shoe',
      'picture': 'images/products/shoe1.jpg',
      'old_price': '1000',
      'price': '900'
    },
    {
      'name': 'SKT',
      'picture': 'images/products/skt1.jpeg',
      'old_price': '1000',
      'price': '900'
    }
  ];

  @override
  _SimilarProductState createState() => _SimilarProductState();
}

class _SimilarProductState extends State<SimilarProduct> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: widget.product_list.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (BuildContext context, int index) {
          return SimilarSingleProduct(
              widget.product_list[index]['name'],
              widget.product_list[index]['picture'],
              widget.product_list[index]['old_price'],
              widget.product_list[index]['price']);
        });
  }
}

class SimilarSingleProduct extends StatelessWidget {
// Design of single Product
  final prod_name;
  final prod_picture;
  final old_price;
  final price;

  SimilarSingleProduct(
      this.prod_name, this.prod_picture, this.old_price, this.price);

  @override
  Widget build(BuildContext context) {
    return Card(
      //For looking like card
      child: Hero(
        //for getting opening animation
        tag: Text('one'),
        child: Material(
          child: InkWell(
            //for getting on click
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>

                    //Opening the page of product detail

                    ProductDetails(prod_name, prod_picture, old_price, price))),
            child: GridTile(
              //For getting Grid Style
              footer: Container(
                  //for controlling color
                  color: Colors.white,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          prod_name,
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        "\$${price}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                            fontSize: 14.0),
                      )
                    ],
                  )),
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
