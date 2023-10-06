import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() => runApp(Myapp());

class Myapp extends StatelessWidget {
  Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: First_screen(),
    );
  }
}

class First_screen extends StatefulWidget {
  First_screen({Key? key}) : super(key: key);

  @override
  State<First_screen> createState() => _First_screenState();
}
class _First_screenState extends State<First_screen> {
  Future checkConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      await Fluttertoast.showToast(msg: "Connected with netwrok");
    } else if (connectivityResult == ConnectivityResult.wifi) {
      await Fluttertoast.showToast(msg: "Connected with wifi",fontSize: 40);
    } else {
      await Fluttertoast.showToast(msg: "Connection lost",fontSize: 20);
    }
  }
  StreamSubscription? subscription;
  @override
  void initState() {
    subscription=Connectivity().onConnectivityChanged.listen((event) {checkConnection();});
    super.initState();
  }
  @override
  void dispose() {
    subscription?.cancel();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child:Container(
            color: Colors.green,
          ),
        ),
      ),
    );
}}
