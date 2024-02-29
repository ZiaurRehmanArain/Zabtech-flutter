import 'package:flutter/material.dart';

class TableWidget extends StatelessWidget {
  const TableWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Table(
          // defaultColumnWidth: FlexColumnWidth(50),
          border: TableBorder.all(width: 2, color: Colors.green),
          children: [
            TableRow(children: [
              Column(
                children: [Text('id')],
              ),
              Column(
                children: [Text('id')],
              ),
              Column(
                children: [Text('Name')],
              ),
              Column(
                children: [Text('course')],
              ),
            ]),
            TableRow(
              children: [
                   Column(
                children: [Text('id')],
              ),
              Column(
                children: [Text('id')],
              ),
              Column(
                children: [Text('Name')],
              ),
              Column(
                children: [Text('course')],
              ),
              ]
            )
            
          ],
        ),
      ),
    );
  }
}
