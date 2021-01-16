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
  return ButtonBar(
    alignment: MainAxisAlignment.spaceEvenly,
    children: [
      OutlinedButton(
          onPressed: () => print("button1 Presseed!"), child: Text("Sign Up")),
      ElevatedButton(
          onPressed: () => print("button2 Presseed!"), child: Text("Login")),
    ],
  );
}

Widget _usernameAndPasswords() {
  return Column(
    children: [
      TextField(
        obscureText: false,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Email',
        ),
      ),
      TextField(
        obscureText: true,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Password',
        ),
      ),
    ],
  );
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
