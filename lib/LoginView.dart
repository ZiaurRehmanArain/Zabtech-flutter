import 'package:database/HomePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  createAcount(BuildContext context) async {
    final credential = FirebaseAuth.instance;
    credential
        .signInWithEmailAndPassword(
            email: email.text, password: password.text)
        .then((user) {
      print('Login successful');
      print(user.user!.email);
      Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));

    }).catchError((e) {
      print(e.toString());
    });
  }

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Login '),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            children: [
              TextField(
                controller: email,
                decoration: InputDecoration(hintText: 'Email'),
              ),
              TextField(
                controller: password,
                decoration: InputDecoration(hintText: 'Password'),
              ),
              ElevatedButton(
                  onPressed: () {
                    // print(email.text);
                    createAcount(context);
                  },
                  child: Text('Sign Up'))
            ],
          ),
        ));
  }
}
