import 'package:flutter/material.dart';

class Item {
  String name;
  int quantity;

  Item({this.name, this.quantity});

  static List<Item> getItems(){
    return items;
  }

  static addItems(name, quantity) {
    var item = new Item();
    item.name = name;
    item.quantity = quantity;
    items.add(item);
  }
}

List<Item> items = [];

class ShoppingTable extends StatefulWidget {
  ShoppingTable() : super();

  @override
  ShoppingTableState createState() => ShoppingTableState();
}


class ShoppingTableState extends State<ShoppingTable>{
  List<Item> items;
  List<Item> selectedItems;

  @override
  void initState(){
    super.initState();
    selectedItems = [];
    items = Item.getItems();
  }

  onSelectedItem(bool selected, Item item) async {
    setState() {
      if (selected == true) {
        selectedItems.add(item);
      }
      else {
        selectedItems.remove(item);
      }
    }
  }

  deleteSelected() async {
    setState(() {
      if (selectedItems.isNotEmpty) {
        List<Item> temp = [];
        temp.addAll(selectedItems);
        for (Item item in temp) {
          items.remove(item);
          selectedItems.remove(item);
        }
      }
    });
  }

  SingleChildScrollView dataBody() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: <Widget>[
          MaterialButton(
            child: Text('Add Another Item'),
            onPressed: () {
              var item = new Item();
              item.name = "";
              item.quantity = 1;
              items.add(item);
              setState(() {});
            },
          ),

          DataTable(
            sortColumnIndex: 0,
            columns:[
              DataColumn(
                  label: Text("Item"),
                ),
              DataColumn(
                label: Text("Quantity"),
              ),
            ],
            rows: items
                .map(
                  (item) => DataRow(
                  selected: selectedItems.contains(item),
                  onSelectChanged: (b) {
                    onSelectedItem(b, item);
                  },
                  cells: [
                    DataCell(
                      TextField(
                        onChanged: (text) {
                          item.name = text;
                        },
                      ),
                    ),
                    DataCell(
                      Text(item.quantity.toString()),
                    ),
                  ]),
            ).toList(),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Selected Items"),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        verticalDirection: VerticalDirection.down,
        children: <Widget>[
          Expanded(
            child: dataBody(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(20.0),
                child: OutlineButton(
                  child: Text('SELECTED ${selectedItems.length}'),
                  onPressed: () {},
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: OutlineButton(
                  child: Text('DELETE SELECTED'),
                  onPressed: selectedItems.isEmpty
                      ? null
                      : () {
                    deleteSelected();
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

//TODO: Implement the functionality for users to input their desired items.
// Try using DataTable
class InputItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your Shopping List',
      home: DataTable(),
    );
  }
}