import 'package:flutter/material.dart';

class TableDataWidget extends StatelessWidget {
  const TableDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data table'),
        actions: [
          PopupMenuButton<String>(
            position: PopupMenuPosition.under,
      icon: Icon(Icons.more_vert),
      itemBuilder: (BuildContext context) {
        return <PopupMenuEntry<String>>[
          PopupMenuItem<String>(
            value: 'menu1',
            child: Text('Menu 1'),
          ),
          PopupMenuItem<String>(
            value: 'menu2',
            child: Text('Menu 2'),
          ),
          PopupMenuItem<String>(
            value: 'menu3',
            child: Text('Menu 3'),
          ),
        ];
      },
      onSelected: (String value) {
        // Handle menu item selection
        print('Selected: $value');
      },
    )
        ],
      ),
      body: Container(
        child: Center(
          child: Column(
            children: [
              Container(
                height: 70,
                width: MediaQuery.of(context).size.width * .67,
                child: Center(child: Text('xyz')),
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 212, 212, 212),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10))),
              ),
              DataTable(
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 212, 212, 212),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10))),
                  columns: [
                    DataColumn(label: Text('id')),
                    DataColumn(label: Text('Name')),
                    DataColumn(label: Text('Course')),
                  ],
                  rows: [
                    DataRow(cells: [
                      DataCell(Text('1')),
                      DataCell(Text('abc')),
                      DataCell(Text('web')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('2')),
                      DataCell(Text('abc')),
                      DataCell(Text('android'))
                    ]),
                    DataRow(cells: [
                      DataCell(Text('2')),
                      DataCell(Text('abc')),
                      DataCell(Text('android'))
                    ]),
                    DataRow(cells: [
                      DataCell(Text('2')),
                      DataCell(Text('abc')),
                      DataCell(Text('android'))
                    ]),
                    DataRow(cells: [
                      DataCell(Text('2')),
                      DataCell(Text('abc')),
                      DataCell(Text('android'))
                    ]),
                  ]),
            ],
          ),
        ),
      ),
    );
  }
}
