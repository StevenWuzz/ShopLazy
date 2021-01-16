import 'package:flutter/material.dart';
import 'package:shoplazy/SignUp.dart';
import 'package:shoplazy/StartScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
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

  final formKey =
      new GlobalKey<FormState>(); //I know global variables ar bad, but idc atm
  String _email;
  String _pass;

  Widget _loginAndSignup(context) {
    return Column(children: [
      ButtonBar(
        alignment: MainAxisAlignment.spaceEvenly,
        children: [
          OutlinedButton(
              onPressed: () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => SignUp())),
              child: Text("Sign Up")),
          ElevatedButton(
              onPressed: () => validateAndSubmit(context),
              child: Text("Login")),
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

  bool validateAndSave() {
    print("attempting to login");
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      print(_email + ":" + _pass);
      return true;
    }
    return false;
  }

  Future<dynamic> validateAndSubmit(context) async {
    if (validateAndSave()) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: _email, password: _pass);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => StartScreen()));
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
        } else {
          print("Error: " + e.code);
        }
      }
    }
  }

  Widget _usernameAndPasswords() {
    return Container(
        margin: const EdgeInsets.all(20.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              //margin: const EdgeInsets.only(bottom: 5.0),
              new TextFormField(
                  obscureText: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                  ),
                  validator: (value) => value.isEmpty ? 'BOOO!!!' : null,
                  onSaved: (value) => _email = value),
              new TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                  validator: (value) => value.isEmpty ? 'BOOO!!!' : null,
                  onSaved: (value) => _pass = value),
            ],
          ),
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
}
