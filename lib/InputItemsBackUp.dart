import 'package:flutter/material.dart';
import 'ChooseList.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'ShoppingList.dart';
import 'Item.dart';

BuildContext testContext;

List<Item> items = [];
var currentUser = ShoppingList(userEmail);

class ShoppingTable extends StatefulWidget {
  ShoppingTable() : super();

  @override
  ShoppingTableState createState() => ShoppingTableState();
}

class ShoppingTableState extends State<ShoppingTable> {
  List<Item> items;
  List<Item> selectedItems;
  Iterator<Item> iteratorItems;

  @override
  void initState() {
    super.initState();
    selectedItems = [];
    items = [];
    iteratorItems = ShoppingList.getShoppingList();
    while(iteratorItems.moveNext()){
      items.add(iteratorItems.current);
    }
  }

  onSelectedItem(bool selected, Item item) async {
    setState() {
      if (selected == true) {
        selectedItems.add(item);
      } else {
        selectedItems.remove(item);
      }
    }
  }

  /*
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
  */

  SingleChildScrollView dataBody() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: <Widget>[
          MaterialButton(
            child: Text('Add Another Item'),
            onPressed: () {
              var item = new Item("", 0, "");
              //item.name = "";
              //item.quantity = "";
              items.add(item);
              currentUser.addItem(item);
              setState(() {});
            },
          ),
          DataTable(
            sortColumnIndex: 0,
            columns: [
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
                          item.setName(text);
                        },
                      ),
                    ),
                    DataCell(
                        TextField(
                          onChanged: (quantity){
                            int quant = int.tryParse(quantity);
                            if(quant != null) {
                              item.setQuant(quant);
                            }
                          },
                        )
                    ),
                  ]),
            )
                .toList(),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    testContext = context;
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Selected Items"),
      ),
      body: Column(
        //mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        //verticalDirection: VerticalDirection.down,
        children: <Widget>[
          Expanded(
            child: dataBody(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            //mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(20.0),
                child: OutlineButton(
                  child: Text('Checkout'),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        onTap: onItemTap,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.library_add),
            label: 'Lists',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_shopping_cart),
            label: 'Shop',
          ),
        ],
      ),
    );
  }
}

void onItemTap(int index) {
  if (index == 1) {
    Navigator.push(
        testContext, MaterialPageRoute(builder: (context) => ChooseList()));
  }
}

final _auth = FirebaseAuth.instance;
String userEmail;
void getCurrentUserEmail() async {
  final user =  _auth.currentUser;
  userEmail=user.email;
}

//TODO: Implement the functionality for users to input their desired items.
// Try using DataTable
class InputItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your Shopping List',
      home: ShoppingTable(),
    );
  }
}