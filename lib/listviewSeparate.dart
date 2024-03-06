import 'package:flutter/material.dart';

class ListViewSeparate extends StatelessWidget {
  const ListViewSeparate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('list view separate'),
        ),
        body: ListView.separated(
            itemBuilder: (BuildContext context,  index) {
              return ListTile(
                leading: Icon(Icons.person),
                title: Text('separate text  ${index+1}'),
                subtitle: Text('separate text  ${index+1}'),
              );
            },
            separatorBuilder: (context, i) {
              return Divider();
            },
            itemCount: 10));
  }
}
