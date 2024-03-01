import 'package:flutter/material.dart';
import 'package:listviewapp/data_table.dart';
import 'package:listviewapp/login.dart';
import 'package:listviewapp/table_view.dart';
import 'package:listviewapp/wrap_widget.dart';

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
      home: LoginScreen(),
    );
  }
}
