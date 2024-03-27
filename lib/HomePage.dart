import 'dart:convert';
import 'dart:io';

import 'package:database/LoginView.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseDatabase _database = FirebaseDatabase.instance;

  String _userName = '';
  String _userEmail = '';
  String _userImageUrl = '';
  // CurrentGetData() async {
  //   final currentUser = FirebaseAuth.instance.currentUser;
  //   final ref = FirebaseDatabase.instance.ref();
  //   await ref.child('users/${currentUser!.uid}').once().then((value) {
  //     print(value.snapshot.value);
  //   }).catchError((onError) {
  //     print(onError);
  //   });
  //   // if (snapshot.exists) {
  //   //   print('sddasdasd   sdsd   ${snapshot.value}');
  //   //   //  var values = ;
  //   //   //     setState(() {
  //   //   //       _userName = values['name'];
  //   //   //       _userImageURL = values['image'];
  //   //   //     });
  //   // } else {
  //   //   print('No data available.');
  //   // }
  // }

  // void _getUserProfile() async {
  //   try {
  //     User user = _auth.currentUser!;
  //     if (user != null) {
  //       DatabaseReference userRef = _database.reference().child('users').child(user.uid);
  //     final  DataSnapshot snapshot = await userRef.get();
  //       if (snapshot.value != null) {
  //         setState(() {
  //         Map<String, dynamic> userData = snapshot.value as Map<String, dynamic>;
  //       setState(() {
  //         _userName = userData['name'] ?? '';
  //         _userEmail = userData['email'] ?? '';
  //         _userImageUrl = userData['imageUrl'] ?? '';
  //       });  });
  //       }
  //     }
  //   } catch (e) {
  //     print('Error: $e');
  //   }
  // }

  // void _getUserProfile() async {
  //   try {
  //     User? user = _auth.currentUser;
  //     if (user != null) {
  //       DatabaseReference userRef =
  //           _database.ref().child('users').child(user.uid);
  //       DataSnapshot snapshot = await userRef.get();
  //       if (snapshot.value != null && snapshot.value is Map) {
  //         Map<String, dynamic> userData =
  //             snapshot.value as Map<String, dynamic>;
  //         setState(() {
  //           _userName = userData['name'] ?? '';
  //           _userEmail = userData['email'] ?? '';
  //           // _userImageUrl = userData['imageUrl'] ?? '';
  //         });
  //         print(_userEmail);
  //       }
  //     }
  //   } catch (e) {
  //     print('Error: $e');
  //   }
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // CurrentGetData();
    // _getUserProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("home Page"),
        actions: [
          IconButton(
              onPressed: () async {
                final SharedPreferences prefs =
                    await SharedPreferences.getInstance();
                prefs.setBool('islogin', false);
                await FirebaseAuth.instance.signOut();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginView()));
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: StreamBuilder(
        stream: FirebaseDatabase.instance.ref("products").onValue,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          else{

            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: snapshot,
              itemBuilder: (BuildContext context, int index) {
                return ;
              },
            ),

          }
        },
      ),
    );
  }
}
