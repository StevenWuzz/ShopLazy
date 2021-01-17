import 'package:flutter/material.dart';
import "StartShopping.dart";
import 'package:shoplazy/InputItems.dart';
import 'PopUp.dart';
import 'PopUpContent.dart';
import 'package:shoplazy/LoginPage.dart';
import 'package:firebase_auth/firebase_auth.dart';

BuildContext testContext;

class ChooseList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    testContext = context; // This is sketchy as hell D:
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Choose Lists!"),
        actions: <Widget>[
          IconButton(
            onPressed: () => _signOut(context),
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: BuildList(),
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

class BuildList extends StatefulWidget {
  @override
  _BuildListState createState() => _BuildListState();
}

class _BuildListState extends State<BuildList> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return buildList();
  }

  Widget buildList() {
    return ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemCount: 2,
        itemBuilder: (_, i) {
          return _buildRow(i);
        });
  }

  Widget _buildRow(int index) {
    return Container(
        padding: EdgeInsets.only(bottom: 15),
        child: ListTile(
          tileColor: Color.fromARGB(50, 0, 0, 200),
          onTap: () => showPopup(context, _popupBody(), 'Popup Demo'),
          key: Key(index.toString()),
          leading: Text("50%"),
          title: Text("Joe"),
          trailing: Checkbox(
              value: isChecked,
              onChanged: (_) => setState(() => isChecked = !isChecked)),
        ));
  }
}

Future<void> _signOut(context) async {
  await FirebaseAuth.instance.signOut();

  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
}

showPopup(BuildContext context, Widget widget, String title,
    {BuildContext popupContext}) {
  Navigator.push(
    context,
    PopupLayout(
      top: 50,
      left: 30,
      right: 30,
      bottom: 50,
      child: PopupContent(
        content: Scaffold(
          appBar: AppBar(
            title: Text(title),
            leading: new Builder(builder: (context) {
              return IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  try {
                    Navigator.pop(context); //close the popup
                  } catch (e) {}
                },
              );
            }),
            brightness: Brightness.light,
          ),
          resizeToAvoidBottomPadding: false,
          body: widget,
        ),
      ),
    ),
  );
}

Widget _popupBody() {
  return Container(
    child: Text('This is a popup window'),
  );
}
