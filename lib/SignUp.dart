import 'package:flutter/material.dart';
import 'package:shoplazy/LoginPage.dart';
import 'package:shoplazy/StartScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _SignUpState();
  }
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
  String _confirmPass;

  Widget _loginAndSignup(context) {
    return Column(children: [
      ButtonBar(
        alignment: MainAxisAlignment.spaceEvenly,
        children: [
          OutlinedButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginPage())),
              child: Text("I have an account")),
          ElevatedButton(
              onPressed: () => validateAndSubmit(context),
              child: Text("Sign up")),
        ],
      ),
    ]);
  }

  bool validateAndSave() {
    print("attempting to Sign up");
    final form = formKey.currentState;
    form.save();
    if (form.validate()) {
      print(_email + ":" + _pass);
      return true;
    }
    return false;
  }

  Future<dynamic> validateAndSubmit(context) async {
    if (validateAndSave()) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: _email, password: _pass);
        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => StartScreen()));
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
              Container(
                  padding: EdgeInsets.only(bottom: 15),
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                      fontSize: 50,
                    ),
                  )),
              //margin: const EdgeInsets.only(bottom: 5.0),
              new TextFormField(
                  obscureText: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                  ),
                  validator: (value) => value.isEmpty ? 'BOOO!!!' : null,
                  onSaved: (value) => _email = value),
              Container(
                padding: EdgeInsets.only(
                  top: 15,
                  bottom: 15,
                ),
                child: TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                    validator: (value) => value.isEmpty ? 'BOOO!!!' : null,
                    onSaved: (value) => _pass = value),
              ),
              new TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Confirm Password',
                  ),
                  validator: (value) {
                    if (value.isEmpty) return 'BOOO!!!';
                    if (_confirmPass != _pass) return 'Passwords dont match';
                    return null;
                  },
                  onSaved: (value) => _confirmPass = value),
            ],
          ),
        ));
  }
}
