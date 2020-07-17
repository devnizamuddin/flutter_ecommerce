import 'package:flutter/material.dart';

class SingleCartProduct extends StatelessWidget {
  final card_prod_name;
  final card_prod_picture;
  final card_prod_price;
  final card_prod_size;
  final card_prod_color;
  final card_prod_quantity;

  SingleCartProduct(
      this.card_prod_name,
      this.card_prod_picture,
      this.card_prod_price,
      this.card_prod_size,
      this.card_prod_color,
      this.card_prod_quantity);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        //===============Product Name===================//

        leading: Image.asset(card_prod_picture,height: 80.0,width: 80.0,),
        title: Text(card_prod_name),
        subtitle: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                //===============Product Size===================//

                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Text('Size'),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    card_prod_size,
                    style: TextStyle(color: Colors.red),
                  ),
                ),

                //===============Product Color===================//
                Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 8.0, 8.0, 8.0),
                  child: Text('Color'),
                ),
                Text(
                  card_prod_color,
                  style: TextStyle(color: Colors.red),
                ),


              ],
            ),

            //===============Product Price===================//
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                "\$${card_prod_price}",
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 17.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),

        //=======================Product Quantity=================
        trailing: Column(
          children: <Widget>[
            Expanded(child: IconButton(icon: Icon(Icons.arrow_drop_up),onPressed: (){},)),
            Text("$card_prod_quantity"),
            Expanded(child: IconButton(icon: Icon(Icons.arrow_drop_down),onPressed: (){},)),
          ],
        )
      ),
    );
  }
}
