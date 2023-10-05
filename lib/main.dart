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
        body:OrientationBuilder(builder: (_,orientation){
          if(orientation==Orientation.portrait){
            return Container(
              color: Colors.yellow,
            );
          }else{
            return Container(
              color: Colors.brown,
            );
          }
        }

    )

    );
  }
}
