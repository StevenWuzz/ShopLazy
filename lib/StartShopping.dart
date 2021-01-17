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
          BuildIngredients(),
          Text("yooooo"),
          Text("Page 3!"),
          Text("last page..."),
          Text("SIKE"),
        ],
      ),
    ]);
  }

  void changeStack(int index) => setState(() => currentIndex = index);
}

class BuildIngredients extends StatefulWidget {
  @override
  _BuildIngredientsState createState() => _BuildIngredientsState();
}

class _BuildIngredientsState extends State<BuildIngredients> {
  //double currentOpacity = 1.0;
  bool isEnabled = true;

  @override
  Widget build(BuildContext context) {
    return buildList();
  }

  Widget buildList() {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        padding: EdgeInsets.all(16.0),
        itemCount: 2,
        itemBuilder: (_, i) {
          return _buildRow(i);
        });
  }

  Widget _buildRow(int index) {
    return Container(
      padding: EdgeInsets.only(bottom: 15),
      child: Opacity(
          opacity: isEnabled ? 1.0 : 0.6,
          child: ListTile(
            tileColor: Color.fromARGB(50, 0, 0, 200),
            onTap: () => setState(() => isEnabled = !isEnabled),
            key: Key(index.toString()),
            leading: Text("12"),
            title: Text("Banana"),
          )),
    );
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
