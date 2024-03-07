import 'dart:html';

import 'package:flutter/material.dart';

class cards extends StatelessWidget {
  final String img, title, des;
  final Function ontap;
  const cards(
      {super.key,
      required this.title,
      required this.des,
      required this.img,
      required this.ontap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        ontap();
      },
      child: Hero(
        tag: BackgroundFetchClickEvent,
        child: Container(
          decoration: BoxDecoration(
              // color:Colors.grey
              ),
          child: Card(
            child: Column(
              children: [
                Image.network(
                  img,
                  // 'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8c2hvZXN8ZW58MHx8MHx8fDA%3D',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * .15,
                ),
                Text(title),
                Text(des)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
