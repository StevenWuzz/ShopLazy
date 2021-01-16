import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  @override //TODO start and finish
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First time starting up the app!'),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Changing screen works wooooooooooooo"),
          ],
        ),
      ),
    );
  }
}
