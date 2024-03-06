import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GirdviewBuilder extends StatelessWidget {
   GirdviewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    var devicewith=MediaQuery.of(context).size.width;
    return Scaffold(
      body: GridView.builder(
        gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: devicewith<=530? 2:3,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5
        ),
        itemCount: 9,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            decoration: BoxDecoration(
              // color:Colors.grey
            ),
            child:Card(
              child: Column(
                children: [
                  Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSG0wTnOunXv5cNoX73UXN4rmaGTSpF6gsg1g&usqp=CAU',fit: BoxFit.cover,height:MediaQuery.of(context).size.height*.2 ,width: MediaQuery.of(context).size.width,),
                Text('Name'),
                Text('description')
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
