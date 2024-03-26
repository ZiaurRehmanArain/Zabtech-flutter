import 'package:database/add_products.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class AdminView extends StatelessWidget {
  AdminView({super.key});
  // DatabaseReference ref = FirebaseDatabase.instance.ref("products");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(('Admin Home Page')),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (_) => AddCardView()));
                },
                child: Text('Add Card'))
          ],
        ),
        body: FirebaseAnimatedList(
          query: FirebaseDatabase.instance.ref("products"),
          itemBuilder: (context, snapshot, animation, index) => Column(
            children: [Image.network(snapshot.child('product_image').value.toString(),)],
          ),
        ));
  }
}
