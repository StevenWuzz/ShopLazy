import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _title(),
            _usernameAndPasswords(),
            _loginAndSignup(context),
          ],
        ),
      ),
    );
  }
}

Widget _loginAndSignup(context) {
  return Column(children: [
    ButtonBar(
      alignment: MainAxisAlignment.spaceEvenly,
      children: [
        OutlinedButton(
            onPressed: () => print("button1 Presseed!"),
            child: Text("Sign Up")),
        ElevatedButton(
            onPressed: () => print("button2 Presseed!"), child: Text("Login")),
      ],
    ),
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Checkbox(value: false, onChanged: null),
        Text("Stay logged in?")
      ],
    )
  ]);
}

Widget _usernameAndPasswords() {
  return Container(
      margin: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 5.0),
            child: TextField(
              obscureText: false,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 5.0),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
              ),
            ),
          ),
        ],
      ));
}

Widget _title() {
  return Text(
    "ShopLazy",
    textAlign: TextAlign.center,
    style: TextStyle(fontSize: 50),
  );
  /*return RichText(
    textAlign: TextAlign.center,
    text: TextSpan(
      text: "ShopLazy",
    ),
  );*/
}
