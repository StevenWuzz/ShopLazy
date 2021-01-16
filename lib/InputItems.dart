import 'package:flutter/material.dart';

class Item{
  String name;
  int quantity;

  Item({this.name, this.quantity});

  static List<Item> getItems(){
    return items;
  }

  static addItems(name, quantity){
    var item = new Item();
    item.name = name;
    item.quantity = quantity;
    items.add(item);
  }
}
List<Item> items = [];

/*
class ShoppingTable extends StatefulWidget {
  ShoppingTable() : super();

  final String title = " ";

  //@override
  //ShoppingTableState createState() => ShoppingTableState(); The heck?
}
*/

//TODO: Implement the functionality for users to input their desired items.
// Try using DataTable
class InputItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Input your items!'),
      ),
      body: Text("Inputs your items!"),
    );
  }
}