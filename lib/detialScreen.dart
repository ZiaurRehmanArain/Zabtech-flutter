import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetialScreen extends StatelessWidget {
  String title, des, img;
  DetialScreen(
      {super.key, required this.title, required this.des, required this.img});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('detial'),
      ),
      body: Column(
        children: [
          Image.network(img),
          Text(title),
          Text(des),
        ],
      ),
    );
  }
}
