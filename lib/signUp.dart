import 'package:database/LoginView.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatelessWidget {
  SignUpView({super.key});

  createAcount(BuildContext context) async {
    final credential = FirebaseAuth.instance;
    credential
        .createUserWithEmailAndPassword(
            email: email.text, password: password.text)
        .then((user) {
      print('account createde');
      print(user.user!.email);
      Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginView()));
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
          title: Text('Sign Up'),
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
