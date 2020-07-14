import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Category('images/cats/accessories.png', 'Accessories'),
          Category('images/cats/dress.png', 'Dress'),
          Category('images/cats/formal.png', 'Formal'),
          Category('images/cats/informal.png', 'Informal'),
          Category('images/cats/jeans.png', 'Jeans'),
          Category('images/cats/shoe.png', 'Shoe'),
          Category('images/cats/tshirt.png', 'T-shirt'),
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String _image_location;
  final String _image_caption;

  Category(this._image_location, this._image_caption);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: InkWell(
        onTap: () {},
        child: Container(
          width: 80.0,
          child: ListTile(
            title: Image.asset(
              _image_location,
            ),
            subtitle: Text(
              _image_caption,
            ),
          ),
        ),
      ),
    );
  }
}
