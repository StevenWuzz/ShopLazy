import 'package:flutter/material.dart';
import "ShoppingList.dart";

class ChooseList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
  print("YOOOOOO");
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
