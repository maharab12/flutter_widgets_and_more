import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
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
  FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController pincontroller=TextEditingController();
  TextEditingController phonecontroller=TextEditingController();

  phoneAuth() async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phonecontroller.text,
        timeout: Duration(seconds: 40),
         verificationCompleted: (PhoneAuthCredential credential)async{
        var result= await _auth.signInWithCredential(credential);
        User? user=result.user;
        if(user!=null){
          Navigator.push(context, CupertinoPageRoute(builder: (context)=>Home()));
        }
        },
        verificationFailed: (FirebaseAuthException exception){
        return print(exception);
        },
      // if verifyPhoneNumber doesn't work means automaticly doesn't work then the manual code or below function will work

        codeSent: (String verificationId, int? resendToken){
        showDialog(context: context, builder: (context){
          return AlertDialog(
            title: Text("Enter the code"),
            content: Column(
              children: [
                TextField(
                  controller: pincontroller,
                ),
                ElevatedButton(onPressed: () async {
                  var smscode= pincontroller.text;
                  PhoneAuthCredential phoneauthcredential = PhoneAuthProvider.credential(
                      verificationId: verificationId,
                      smsCode: smscode,);
                  var result= await _auth.signInWithCredential(phoneauthcredential);
                  User? user=result.user;
                  if(user!=null){
                    Navigator.push(context, CupertinoPageRoute(builder: (context)=>Home()));
                  }


                }, child: Text("Send"))
              ],
            ),
          );
        });
        },
        codeAutoRetrievalTimeout: (String verificationId){

        },

    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Phone auth",
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 40),
              TextFormField(
                controller: phonecontroller,
                  decoration: InputDecoration(
                      labelText: "Phone Number",
                      enabledBorder:OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.greenAccent,width: 5)
                  )),
                  onChanged: (value) {
                    setState(() {});
                  }),
              SizedBox(height: 50,),
              ElevatedButton(
                onPressed: () {
                  phoneAuth();
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
