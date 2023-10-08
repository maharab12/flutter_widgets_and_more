import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Demo",
      home: Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  Future signIn() async {
    try {
      final GoogleSignInAccount? googleSignInAccount = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleSignInAuthentication = await googleSignInAccount?.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication?.idToken,
        accessToken: googleSignInAuthentication?.accessToken,
      );
      final UserCredential authResult = await FirebaseAuth.instance.signInWithCredential(credential);
      final User? user = authResult.user;
      if (user != null) {
        Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
      }
    } catch (e) {
      print("Error during sign-in: $e");
      // Handle the error here
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Sign Up",
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  signIn();
                },
                child: Text("Sign up"),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome to Home"),
      ),
      body: Center(
        child: Text("You are now signed in!"),
      ),
    );
  }
}
