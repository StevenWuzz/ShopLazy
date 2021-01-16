import 'package:flutter/material.dart';
import "ShoppingList.dart";
import 'package:shoplazy/InputItems.dart';

BuildContext testContext;

class ChooseList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    testContext = context; // This is sketchy as hell D:
    return Scaffold(
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
}
