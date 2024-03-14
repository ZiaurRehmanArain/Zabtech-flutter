import 'package:flutter/material.dart';

class MobileView extends StatelessWidget {
  const MobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('mobile view',style: TextStyle(color: Colors.white),),backgroundColor: Colors.deepPurple,
      
      ),
      
      backgroundColor: Colors.blue,
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 100,
        ),
        itemCount: 20,
        itemBuilder: (BuildContext context, int index) {
          return Card(
          );
        },
      ),
      drawer: Drawer(),
      );
  }
}