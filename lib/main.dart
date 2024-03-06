import 'package:flutter/material.dart';
import 'package:gridview/chat_screen.dart';
import 'package:gridview/girdviewBuilder1.dart';
import 'package:gridview/girdviewbuilder.dart';
import 'package:gridview/listviewSeparate.dart';
import 'package:gridview/wheelscrollview.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home:GirdviewBuilder(),


    );
  }
}
