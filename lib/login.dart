import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'home..dart';
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage> {
  String email = "";
  String password = "";
  void _login() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } catch (e) {
      print("Login error: $e");
    }}
  void _register() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } catch (e) {
      print("Registration error: $e");}}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Login",
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Email"),
                onChanged: (value) {
                  setState(() {
                    email = value;});},),
              TextFormField(
                decoration: InputDecoration(labelText: "Password"),
                onChanged: (value) {
                  setState(() {
                    password = value;});},),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  _login();},
                child: Text("Login"),
              ),
              TextButton(
                onPressed: () {
                  _register();
                },
                child: Text("Register"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
