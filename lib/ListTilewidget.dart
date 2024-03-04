import 'package:flutter/material.dart';

class ListTileWidget extends StatelessWidget {
  const ListTileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.black,
              ),
              title: Text('title'),
              subtitle: Text('Subtitle'),
              trailing: Text('trailing'),
            ),
          ),
         
        ],
      ),
    );
  }
}
