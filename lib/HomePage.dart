import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CurrentGetData() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    final ref = FirebaseDatabase.instance.ref();
    await ref.child('users/${currentUser!.uid}').once().then((value) {
      print(value.snapshot.value);
    }).catchError((onError) {
      print(onError);
    });
    // if (snapshot.exists) {
    //   print('sddasdasd   sdsd   ${snapshot.value}');
    //   //  var values = ;
    //   //     setState(() {
    //   //       _userName = values['name'];
    //   //       _userImageURL = values['image'];
    //   //     });
    // } else {
    //   print('No data available.');
    // }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    CurrentGetData();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
