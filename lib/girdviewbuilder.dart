import 'package:flutter/material.dart';

class GirdViewBuilder extends StatefulWidget {
  const GirdViewBuilder({super.key});

  @override
  State<GirdViewBuilder> createState() => _GirdViewBuilderState();
}

class _GirdViewBuilderState extends State<GirdViewBuilder> {
  @override
  Widget build(BuildContext context) {
    var deviceWith = MediaQuery.of(context).size.width;
    print(deviceWith);

    return Scaffold(
      body: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: deviceWith<=600?2 :deviceWith>=600  && deviceWith<=900?3:4, mainAxisSpacing: 10, crossAxisSpacing: 10),
        children: [
          Container(
            // width: ,
            color: Colors.amber,
          ),
          Container(
            // width: ,
            color: Colors.amber,
          ),
          Container(
            // width: ,
            color: Colors.amber,
          ),
          Container(
            // width: ,
            color: Colors.amber,
          ),
          Container(
            // width: ,
            color: Colors.amber,
          ),
        ],
      ),
    );
  }
}
