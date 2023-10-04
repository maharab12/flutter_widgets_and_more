import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/home.dart';

void main()=>runApp(Myapp());
class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Homepage(),
    );
  }
}
class Homepage extends StatefulWidget {
  const Homepage({super.key});
  @override
  State<Homepage> createState() => _HomepageState();
}
class _HomepageState extends State<Homepage> {
  @override
  final _formkey = GlobalKey<FormState>();
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  validator: (value){
                    if(value!.isEmpty){
                      if(value.length<3) {
                        return "please enter at least 3 wrod";
                      }}},),
                TextFormField(
                  validator: (value){
                    if(value!.isEmpty){
                      return "Enter Your Phone Number";
                    }
                  },
                ),
                TextFormField(
                  validator: (value){
                    if(value!.isEmpty){
                      return "Enter Your Age";
                    }
                  },
                ),
                ElevatedButton(onPressed: (){
                  if(_formkey.currentState!.validate()){
                    Navigator.push(context, CupertinoPageRoute(builder: (context)=>Hi()));
                  }
                },
                    child: Text("Login"))
              ],)
        ),
      ),
    );
  }
}
