import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(Myapp());

class Myapp extends StatelessWidget {
  Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: First_screen(),
      initialRoute: "/",
      routes: {
        "/first": (context) => First_screen(),
        "/second": (context) => Second_screen(),
      },
    );
  }
}

class First_screen extends StatefulWidget {
  First_screen({Key? key}) : super(key: key);

  @override
  State<First_screen> createState() => _First_screenState();
}
class _First_screenState extends State<First_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //Navigator.pushNamed(context, "/second");
          //we can also use push to navigate
          //cupertinoPageRoute give scrollview
          //Navigator.push(context, CupertinoPageRoute(builder: (context)=>Second_screen()));
         // Navigator.push(context, MaterialPageRoute(builder: (context)=>Second_screen()));
          //we can use pushReplacement which will go to the one way no like stack.
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Second_screen()));
        },
        child: Text("First_second"),
      ),
    );
  }
}

class Second_screen extends StatefulWidget {
  Second_screen({Key? key}) : super(key: key);

  @override
  State<Second_screen> createState() => _Second_screenState();
}

class _Second_screenState extends State<Second_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //Navigator.pushNamed(context, "/first");
          //Navigator.push(context, CupertinoPageRoute(builder: (context)=>First_screen()));
          //Navigator.push(context, MaterialPageRoute(builder: (context)=>First_screen()));
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>First_screen()));
        },
        child: Text("second"),
      ),
    );
  }
}
