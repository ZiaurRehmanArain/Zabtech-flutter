import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ListViews extends StatelessWidget {
  const ListViews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List view'),
      ),
      body: Column(
        children: [
          Container(
            height: 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.black,
                  margin: EdgeInsets.all(2),
                ),
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.black,
                  margin: EdgeInsets.all(2),
                ),
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.black,
                  margin: EdgeInsets.all(2),
                ),
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.black,
                  margin: EdgeInsets.all(2),
                ),
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.black,
                  margin: EdgeInsets.all(2),
                ),
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.black,
                  margin: EdgeInsets.all(2),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              itemExtent: 100,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.black,
                  margin: EdgeInsets.all(2),
                ),
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.black,
                  margin: EdgeInsets.all(2),
                ),
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.black,
                  margin: EdgeInsets.all(2),
                ),
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.black,
                  margin: EdgeInsets.all(2),
                ),
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.black,
                  margin: EdgeInsets.all(2),
                ),
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.black,
                  margin: EdgeInsets.all(2),
                ),
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.black,
                  margin: EdgeInsets.all(2),
                ),
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.black,
                  margin: EdgeInsets.all(2),
                ),
              ],
            ),
          ),


          
        ],
      ),
    );
  }
}
