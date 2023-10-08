import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Welcome, ${FirebaseAuth.instance.currentUser!.email}!"),
            Text("Welcome, ${FirebaseAuth.instance.currentUser!.displayName}!"),
            Container(
              height: 100,
              width: 100,
              child: Image.network("${FirebaseAuth.instance.currentUser!.displayName}"),
            )
          ],
        ),
      ),
    );
  }
}
