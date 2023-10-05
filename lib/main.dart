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
        body:LayoutBuilder(builder: (_,contraints){
          if(contraints.maxWidth<480){
            return Container(
              child: Center(
                child: Text("Less then 480"),
              ),
            );
          }else if(contraints.maxWidth>480&&contraints.maxWidth<800){
            return Container(
              child: Center(
                child: Text("Less then 400"),
              ),
            );
          }else{
            return Container(
              child: Center(
                child: Text("grater than 800"),
              ),
            );
          }

        },)

    );
  }
}
