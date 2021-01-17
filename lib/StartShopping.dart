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
      body: BuildList(),
    );
  }
}

class BuildList extends StatefulWidget {
  @override
  _BuildListState createState() => _BuildListState();
}

class _BuildListState extends State<BuildList> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      MyThreeOptions(changeStack),
      //topNavBar(),
      IndexedStack(
        index: currentIndex,
        children: [
          buildList(),
          Text("yooooo"),
          Text("Page 3!"),
          Text("last page..."),
          Text("SIKE"),
        ],
      ),
    ]);
  }

  void changeStack(int index) => setState(() => currentIndex = index);

  /*Widget topNavBar() {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(8),
        //padding: const EdgeInsets.only(right: 15),
        itemCount: 5,
        itemBuilder: (_, int index) {
          return OutlinedButton(
            style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.red)),
            onPressed: () => changeStack(index),
            child: Text("Person #" + index.toString()),
          );
        },
      ),
    );
  }*/

  Widget buildList() {
    return ConstrainedBox(
        constraints: BoxConstraints(minWidth: double.infinity),
        child: DataTable(
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
        ));
  }
}

class MyThreeOptions extends StatefulWidget {
  Function changeStack;
  MyThreeOptions(this.changeStack);

  @override
  _MyThreeOptionsState createState() => _MyThreeOptionsState();
}

class _MyThreeOptionsState extends State<MyThreeOptions> {
  int _value = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(8),
        itemCount: 5,
        itemBuilder: (_, int index) {
          return Container(
              padding: EdgeInsets.only(right: 5, left: 5),
              child: ChoiceChip(
                label: Text('Person #$index'),
                selected: _value == index,
                onSelected: (bool selected) {
                  this.widget.changeStack(index);
                  setState(() {
                    _value = selected ? index : null;
                  });
                },
              ));
        },
      ),
    );
  }
}
