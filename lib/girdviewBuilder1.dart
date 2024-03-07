import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gridview/components/card.dart';
import 'package:gridview/components/maincard.dart';
import 'package:gridview/detialScreen.dart';

class GirdviewBuilder extends StatelessWidget {
  GirdviewBuilder({super.key});

  var productList = [
    {
      'name': "abc",
      'des': 'abc des',
      'img':
          "https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8c2hvZXN8ZW58MHx8MHx8fDA%3D"
    },
    {
      'name': "abc 1",
      'des': 'abc des 1',
      'img':
          "https://images.unsplash.com/photo-1549298916-b41d501d3772?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8c2hvZXN8ZW58MHx8MHx8fDA%3D"
    },
    {
      'name': "abc 2",
      'des': 'abc des 2',
      'img':
          "https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8c2hvZXN8ZW58MHx8MHx8fDA%3D"
    },
  ];

  @override
  Widget build(BuildContext context) {
    var devicewith = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          mainCard(),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: devicewith <= 530 ? 2 : 3,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5),
              itemCount: productList.length,
              itemBuilder: (BuildContext context, index) {
                return cards(
                    title: productList[index]['name'].toString(),
                    des: productList[index]['des'].toString(),
                    img: productList[index]['img'].toString(),
                    ontap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetialScreen(title: productList[index]['name'].toString(), des:  productList[index]['des'].toString(), img:  productList[index]['img'].toString())));
                    });
              },
            ),
          ),
        ],
      ),
    );
  }
}
