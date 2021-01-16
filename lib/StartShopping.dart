import 'package:flutter/material.dart';
import 'package:shoplazy/ShoppingList.dart';

class StartShopping extends StatelessWidget {
  final ShoppingList lists;

  StartShopping({@required this.lists}); // Sending data through screens

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shopping!"),
      ),
      body: buildList(),
    );
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
          DataColumn(label: Text("#")),
          DataColumn(label: Text("Name")),
        ],
        rows: [
          DataRow.byIndex(
              index: 0,
              onSelectChanged: (bool changed) => print("Selected!"),
              cells: [
                DataCell(Text("12")),
                DataCell(Text("Chocolate Milk")),
              ])
        ],
      )
    ],
  );
}
