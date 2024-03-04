import 'package:flutter/material.dart';

class ListViewBuilder extends StatelessWidget {
  ListViewBuilder({super.key});
  var userData = [
    {"id": 1, "name": "abc", "course": "web"},
    {"id": 2, "name": "abc1", "course": "android"},
    {"id": 3, "name": "abc2", "course": "web"},
    {"id": 2, "name": "abc1", "course": "android"},
    {"id": 3, "name": "abc2", "course": "web"},
    {"id": 4, "name": "abc3", "course": "web and app"}
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List view builder'),
      ),
      body: ListView.builder(
          itemCount: userData.length,
          itemBuilder: (context, index) {
            return Container(
              height: 100,
              child: ListTile(
                
                leading: Text(userData[index]['id'].toString()),
                title: Text(userData[index]['name'].toString()),
                subtitle: Text(userData[index]['course'].toString()),
              ),
              margin: EdgeInsets.all(2),
              color: const Color.fromARGB(255, 223, 223, 223),
            );
          }),
    );
  }
}
