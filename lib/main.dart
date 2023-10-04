import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


void main() => runApp(Myapp());

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
  final _key = GlobalKey<ScaffoldState>();
  Widget build(BuildContext context) {
    return Scaffold(

        key: _key,
      //we can use endDrawer for the derawer in the left sit
        //endDrawer: Drawer(),
        drawer: Drawer(
          child: Column(
            children: [])),
        //it has a defautl icon but we will take a custom icon below
        appBar: AppBar(
          title: Text("Drawer"),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_forward),
            onPressed: (){
              _key.currentState?.openDrawer();
            },
          ),
        ),
        body: Center()
    );
  }
}
