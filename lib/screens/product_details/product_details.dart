import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/screens/home/home.dart';
import 'package:flutter_ecommerce/screens/product_details/product_info.dart';
import 'package:flutter_ecommerce/screens/product_details/similar_product.dart';

class ProductDetails extends StatefulWidget {
  final prod_name;
  final prod_picture;
  final old_price;
  final price;

  ProductDetails(this.prod_name, this.prod_picture, this.old_price, this.price);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Colors.red,
        title: InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Home()));
            },
            child: Text('Ecommarce App')),
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
      body: ListView(
        children: <Widget>[
          ProductInfo(widget.prod_name, widget.prod_picture, widget.old_price,
              widget.price),

          // == Custom Button of Size,Color,Quantity == //

          Row(
            children: <Widget>[
              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Size'),
                            content: Text('Choose size'),
                            actions: <Widget>[
                              MaterialButton(
                                  onPressed: () {
                                    Navigator.of(context).pop(context);
                                  },
                                  child: Text('close'))
                            ],
                          );
                        });
                  },
                  textColor: Colors.grey,
                  elevation: 0.2,
                  color: Colors.white,
                  child: Row(
                    children: <Widget>[
                      Expanded(child: Text('Size')),
                      Expanded(
                        child: Icon(Icons.arrow_drop_down),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Color'),
                            content: Text('Choose Color'),
                            actions: <Widget>[
                              MaterialButton(
                                child: Text('close'),
                                onPressed: () {
                                  Navigator.of(context).pop(context);
                                },
                              )
                            ],
                          );
                        });
                  },
                  textColor: Colors.grey,
                  elevation: 0.2,
                  color: Colors.white,
                  child: Row(
                    children: <Widget>[
                      Expanded(child: Text('Color')),
                      Expanded(
                        child: Icon(Icons.arrow_drop_down),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Quantity'),
                            content: Text('Choose quantity'),
                            actions: <Widget>[
                              MaterialButton(
                                onPressed: () {
                                  Navigator.of(context).pop(context);
                                },
                                child: Text('close'),
                              )
                            ],
                          );
                        });
                  },
                  textColor: Colors.grey,
                  elevation: 0.2,
                  color: Colors.white,
                  child: Row(
                    children: <Widget>[
                      Expanded(child: Text('Qty')),
                      Expanded(
                        child: Icon(Icons.arrow_drop_down),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: MaterialButton(
                  color: Colors.red,
                  textColor: Colors.white,
                  onPressed: () {},
                  elevation: 0.2,
                  child: Text('Buy now'),
                ),
              ),
              IconButton(
                icon: Icon(Icons.add_shopping_cart),
                color: Colors.red,
              ),
              IconButton(
                icon: Icon(Icons.favorite_border),
                color: Colors.red,
              )
            ],
          ),
          Divider(),
          ListTile(
            title: Text('Product details'),
            subtitle: Text(
                "It is a long established fact that a reader will be distracted "
                "by the readable content of a page when looking at its layout."
                " The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters,"
                " as opposed to using 'Content here,"
                " content here', making it look like readable English. Many desktop publishing packages and"
                " web page editors now use Lorem Ipsum as their default model text,"
                " and a search for 'lorem ipsum' will uncover many web sites still in their infancy."),
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: Text(
                  'Product Name : ',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: Text(widget.prod_name),
              )
            ],
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: Text(
                  'Product Brand : ',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: Text('Name'),
              )
            ],
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: Text(
                  'Product Condition : ',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: Text('Name'),
              )
            ],
          ),

          //Similar product

          Divider(),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("Similar Product"),
          ),
          Container(
            height: 360,
            child: SimilarProduct(),
          )
        ],
      ),
    );
  }
}
