import 'package:flutter/material.dart';
import 'package:shoplazy/ChooseList.dart';
import 'package:shoplazy/InputItems.dart';

class StartScreen extends StatelessWidget {
  @override //TODO start and finish
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Options'),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 60, left: 20),
        child: Column(
          children: [
            _prompt(),
            Options(),
          ],
        ),
      ),
    );
  }

  // Asking the user to choose
  Widget _prompt() {
    return Container(
        padding: const EdgeInsets.only(bottom: 10),
        child: Text(
          "What Do You Want To Do?",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 30,
          ),
        ));
  }
}

// Two options for the user
class Options extends StatelessWidget {
  Options({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200,
        child: GridView.count(crossAxisCount: 2, children: [
          Card(
              child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => InputItems()));
                  },
                  child: Container(
                    child: Center(
                        child: Text(
                      'I Want To Shop',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    )),
                  ))),
          Card(
              child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ChooseList()));
                  },
                  child: Container(
                    child: Center(
                        child: Text(
                      'I Want To Ask Others \n To Shop For Me ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    )),
                  ))),
        ]));
  }
}
