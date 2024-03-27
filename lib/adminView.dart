import 'package:database/add_products.dart';
import 'package:database/edit_Product.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class AdminView extends StatelessWidget {
  AdminView({super.key});
  // DatabaseReference ref = FirebaseDatabase.instance.ref("products");

  deleteItem(String uid) async {
    print(uid);
    DatabaseReference ref = FirebaseDatabase.instance.ref("products");
    await ref.child(uid).remove().then((value) {
      print('remove item');
    }).catchError((onError) {
      print(onError);
    });
  }

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
          itemBuilder: (context, snapshot, animation, index) => Card(
            child: Column(
              children: [
                Image.network(
                  snapshot.child('product_image').value.toString(),
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
                Text(snapshot.child('name').value.toString()),
                Text(snapshot.child('description').value.toString()),
                Text(snapshot.child('price').value.toString()),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => EditCardView(
                                      name: snapshot
                                          .child('name')
                                          .value
                                          .toString(),
                                      des: snapshot
                                          .child('description')
                                          .value
                                          .toString(),
                                      price: snapshot
                                          .child('price')
                                          .value
                                          .toString(),
                                      uid: snapshot
                                          .child('uid')
                                          .value
                                          .toString())));
                        },
                        child: Text('Edit')),
                    ElevatedButton(
                        onPressed: () {
                          deleteItem(snapshot.child('uid').value.toString());
                        },
                        child: Text('delete')),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
