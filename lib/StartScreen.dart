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
        margin: EdgeInsets.only(top:60, left: 20),
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
    return Text(
        "What Do You Want To Do?",
        style: TextStyle(fontSize: 30),
    );
  }
}

// Two options for the user
class Options extends StatelessWidget{
  Options({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Container(
      height: 200,
      child: GridView.count(
        crossAxisCount: 2,
        children: [
          Card(
            child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => InputItems()));
              },
              child: Container(
                child: Text('I Want To Shop'),
              )
            )
          ),
          Card(
              child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ChooseList()));
                  },
                  child: Container(
                    child: Text('I Want To Ask Others To Shop For Me '),
                  )
              )
          ),
        ]
      )
    );
  }
}
