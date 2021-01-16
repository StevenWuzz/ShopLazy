import 'package:flutter/material.dart';

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
          ],
        ),
      ),
    );
  }

  Widget _prompt() {
    return Text(
        "What Do You Want To Do?",
        style: TextStyle(fontSize: 30),
    );
  }

  //TODO: Use GridView
  /*
  Widget _options(){
    return GridView.count(
      crossAxisCount: 2,
      children: Text(),
    );
  }*/
}
