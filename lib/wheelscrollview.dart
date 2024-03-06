import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class wheelscrollview extends StatelessWidget {
  const wheelscrollview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListWheelScrollView(
            // physics: NeverScrollableScrollPhysics(),
            itemExtent: 200,
            // perspective :1,

            useMagnifier: true,
            children: [
          Container(
            width: double.infinity,
            color: Colors.green,
            child: Text('first'),
          ),
          Container(
            width: double.infinity,
            color: Colors.yellow,
            child: Text('first 1'),
          ),
          Container(
            width: double.infinity,
            color: Colors.orange,
            child: Text('first 2'),
          ),
          Container(
            color: Colors.green,
          ),
          Container(
            color: Colors.green,
          ),
          Container(
            color: Colors.green,
          ),
          Container(
            color: Colors.green,
          ),
          Container(
            color: Colors.green,
          ),
        ]));
  }
}
