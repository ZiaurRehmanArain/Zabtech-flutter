import 'package:flutter/material.dart';

class DesktopView extends StatelessWidget {
  const DesktopView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'desktop view',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.deepPurple,
        ),
        backgroundColor: Colors.red,
        body: Row(
          children: [
            Container(
              width: size.width * .2,
              color: Colors.blueAccent,
              height: size.height,
              child: Text('Slider bar'),
            ),
            Container(
              width: size.width * .8,
              color: const Color.fromARGB(255, 120, 165, 243),
              height: size.height,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisExtent: 120
                ),
                itemCount: 20,
                itemBuilder: (BuildContext context, int index) {
                  return Card();
                },
              ),
            ),
          ],
        ));
  }
}
