import 'package:flutter/material.dart';

class GridTileWidget extends StatelessWidget {
  const GridTileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(width:MediaQuery.of(context).size.width*0.5 ,
      color: Color.fromARGB(25, 158, 158, 158).withOpacity(0.1),
      child: GridTile(
        header: Text('header'),
        child: Image.network("https://images.unsplash.com/photo-1529220813929-597ff9755c1f?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1351&q=80",fit: BoxFit.cover,),
        footer: Container(
          width: double.infinity,
          color: Colors.grey.shade300,
          child: Text('Footer')),
      ),
      height: 150,)    );
  }
}