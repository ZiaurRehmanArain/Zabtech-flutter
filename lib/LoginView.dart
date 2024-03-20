import 'package:database/HomePage.dart';
import 'package:database/signUp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  createAcount(BuildContext context) async {
    // final credential = FirebaseAuth.instance;
    // credential
    //     .signInWithEmailAndPassword(
    //         email: email.text, password: password.text)
    //     .then((user) {
    //   print('Login successful');
    //   print(user.user!.email);
    //   Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));

    // }).catchError((e) {
    //   print(e.toString());
    // });

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email.text, password: password.text);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
      
        debugPrint('Wrong password provided for that user.');
      }
    }catch (err) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("err.toString()"),
        duration: Duration(seconds: 3), // Adjust the duration as needed
      ));
    }
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
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextField(
                  controller: email,
                  decoration: InputDecoration(hintText: 'Email'),
                ),
                TextField(
                  controller: password,
                  decoration: InputDecoration(hintText: 'Password'),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  height: 40,
                  width: MediaQuery.of(context).size.width * .8,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  child: ElevatedButton(
                    onPressed: () {
                      // print(email.text);
                      createAcount(context);
                    },
                    child: Text('Login'),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account? "),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUpView()));
                        },
                        child: Text('Sign Up ')),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
