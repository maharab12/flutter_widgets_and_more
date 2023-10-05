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
        body: Column(
          children:[
            AspectRatio(
            aspectRatio:1,
            child: Container(
              color: Colors.blueGrey,
              child: FractionallySizedBox(
                heightFactor: 0.5,
                widthFactor: 0.5,
                child: Container(
                  color: Colors.yellow,
                ),
              ),
                )),
          FittedBox(
            child: Row(
              children: [
                Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width/3,
                  color: Colors.red,
                ),Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width/3,
                  color: Colors.green,
                ),Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width/2,
                  color: Colors.yellow,
                ),


              ],
            ),
          )
          ]
          ),

    );
  }
}
