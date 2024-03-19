import 'package:database/LoginView.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class SignUpView extends StatelessWidget {
  SignUpView({super.key});

  createAcount(BuildContext context) async {
    final credential = FirebaseAuth.instance;
    credential
        .createUserWithEmailAndPassword(
            email: email.text, password: password.text)
        .then((user) async {
      print('account createde');

      DatabaseReference ref = FirebaseDatabase.instance.ref('users/${user.user!.uid}');
    await  ref.set({
        'uid':user.user!.uid,
        "name":name.text,
        "email":email.text,
        'phone_number':phone.text
      });
      print(user.user!.email);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginView()));
    }).catchError((e) {
      print(e.toString());
    });
  }

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
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
                controller: name,
                decoration: InputDecoration(hintText: 'Name'),
              ),
              TextField(
                controller: email,
                decoration: InputDecoration(hintText: 'Email'),
              ),
              TextField(
                controller: password,
                decoration: InputDecoration(hintText: 'Password'),
              ),
              TextField(
                controller: phone,
                decoration: InputDecoration(hintText: 'Phone number'),
              ),
              ElevatedButton(onPressed: () {}, child: Text('image Picker')),
              ElevatedButton(
                  onPressed: () {
                    // print(email.text);
                    createAcount(context);
                  },
                  child: Text('Sign Up')),
              ElevatedButton(onPressed: () {
                  Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginView()));
 
              }, child: Text('Login ')),

            ],
          ),
        ));
  }
}
