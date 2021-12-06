import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

TextEditingController emailcontroller = TextEditingController();
TextEditingController passwordcontroller = TextEditingController();

FirebaseAuth auth = FirebaseAuth.instance;

Future signup1() async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: emailcontroller.text, password: passwordcontroller.text);
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
    }
  } catch (e) {
    print(e);
  }
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Signup",
            style: TextStyle(fontSize: 29),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            child: TextField(
              controller: emailcontroller,
              decoration: InputDecoration(labelText: "Enter Email"),
            ),
          ),
          SizedBox(height: 10),
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            child: TextField(
              controller: passwordcontroller,
              decoration: InputDecoration(labelText: "Enter Password"),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {
                signup1();
              },
              child: Text("Signup")),
          Text("Already hava an account ? Signup"),
        ],
      ),
    ));
  }
}
