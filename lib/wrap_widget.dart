import 'package:flutter/material.dart';

class WrapWidget extends StatelessWidget {
  const WrapWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Wrap(
              children: [
                Container(
                  child: Image.network('https://media.istockphoto.com/id/1623303770/photo/creative-background-image-is-blurred-evening-city-lights-and-light-snowfall.jpg?b=1&s=612x612&w=0&k=20&c=--I6QisPR7yGmgujOI2co8U3FIK5tBv6xAjMup67ghc=',fit: BoxFit.cover,),
                  margin: EdgeInsets.all(2),
                  width: 100,
                  height: 100,
                  color: Colors.blueGrey,
                ),
                Container(
                  margin: EdgeInsets.all(2),
                  width: 100,
                  height: 100,
                  color: Colors.blueGrey,
                ),
                Container(
                  margin: EdgeInsets.all(2),
                  width: 100,
                  height: 100,
                  color: Colors.blueGrey,
                ),
                Container(
                  margin: EdgeInsets.all(2),
                  width: 100,
                  height: 100,
                  color: Colors.blueGrey,
                ),
                Container(
                  margin: EdgeInsets.all(2),
                  width: 100,
                  height: 100,
                  color: Colors.blueGrey,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
