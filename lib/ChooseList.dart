import 'package:flutter/material.dart';
import "ShoppingList.dart";
import "StartShopping.dart";
import 'package:shoplazy/InputItems.dart';

BuildContext testContext;

class ChooseList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    testContext = context; // This is sketchy as hell D:
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false, title: Text("Choose Lists!")
          /*ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.all(8),
          itemCount: 1,
          itemBuilder: (BuildContext context, int index) {
            return Text("Yahello!");
          },
        ),*/
          ),
      body: buildList(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
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
      floatingActionButton: FloatingActionButton.extended(
        label: Text("Start Shopping!"),
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => StartShopping())),
      ),
    );
  }
}

void onItemTap(int index) {
  if (index == 0) {
    Navigator.push(
        testContext, MaterialPageRoute(builder: (context) => InputItems()));
  }
}

Widget buildList() {
  return Column(
    children: [
      SizedBox(
        height: 50,
        width: double.infinity,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.all(15),
          //padding: const EdgeInsets.only(right: 15),
          itemCount: 50,
          itemBuilder: (_, int index) {
            return OutlinedButton(
              /*style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.red)),*/
              onPressed: null,
              child: Text("Person #" + index.toString()),
            );
          },
        ),
      ),
      DataTable(
        showCheckboxColumn: false,
        columns: [
          DataColumn(label: Text("%")),
          DataColumn(label: Text("Person")),
          DataColumn(label: Text("Add")),
        ],
        rows: [
          DataRow.byIndex(
              index: 0,
              onSelectChanged: (bool yos) => print("Selected!"),
              cells: [
                DataCell(Text("50")),
                DataCell(Text("Joe")),
                DataCell(Checkbox(value: false, onChanged: null)),
              ])
        ],
      )
    ],
  );
}

/*Widget buildList() {
  return ListView.builder(
    itemCount: ShoppingList.shoppingList.length * 2,
    padding: EdgeInsets.all(16.0),
    itemBuilder: (context, i) {
      if (i.isOdd) return Divider();
      final index = i ~/ 2;
      return buildRow(index);
    },
  );
}

Widget buildRow(int index) {
  return ListTile(
    title: Row(
      children: [
        Text(ShoppingList.shoppingList[index].getQuant().toString()),
        SizedBox(width: 10),
        Text(ShoppingList.shoppingList[index].getName())
      ],
    ),
    trailing: Checkbox(value: false, onChanged: null),
  );
}*/
