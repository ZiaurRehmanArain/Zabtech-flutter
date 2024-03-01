import 'package:flutter/material.dart';
import 'package:listviewapp/item_1_view.dart';
import 'package:listviewapp/login.dart';
import 'package:listviewapp/table_view.dart';

class WrapWidget extends StatelessWidget {
  const WrapWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('wrap'),
        backgroundColor: Colors.green,
        actions: [
          PopupMenuButton(
              color: Colors.white,
              icon: Icon(
                Icons.more_vert_rounded,
                color: Colors.white,
              ),
              position: PopupMenuPosition.under,
              onSelected: (v) {
                print(v);
                if (v == 'item 1') {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Item1View()));
                } else if (v == 'item 2') {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Item1View()));
                } else if (v == 'item 3') {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Item1View()));
                }
              },
              itemBuilder: (BuildContext context) => [
                    PopupMenuItem(value: 'item 1', child: Text('item 1')),
                    PopupMenuItem(value: 'item 2', child: Text('item 2')),
                    PopupMenuItem(value: 'item 3', child: Text('item 3')),
                  ])
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Wrap(
              children: [
                Container(
                  child: Image.network(
                    'https://media.istockphoto.com/id/1623303770/photo/creative-background-image-is-blurred-evening-city-lights-and-light-snowfall.jpg?b=1&s=612x612&w=0&k=20&c=--I6QisPR7yGmgujOI2co8U3FIK5tBv6xAjMup67ghc=',
                    fit: BoxFit.cover,
                  ),
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
      drawer: Drawer(
        // backgroundColor: Color(0xff4567ff),
        child: ListView(
          children: [
            Container(
              height: 150,
              padding: EdgeInsets.all(10),
              color: Colors.greenAccent,
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.black,
                      )
                    ],
                  ),
                  Text(
                    'Name',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                  ),
                  Text(
                    'Name',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => TableWidget()));
                  print('click');
                },
                child: Row(
                  children: [Text('Home'), Spacer(), Icon(Icons.home)],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: InkWell(
                onTap: () {},
                child: Row(
                  children: [
                    Text('Short'),
                    Spacer(),
                    Image.network(
                      'https://i.pinimg.com/originals/17/d2/18/17d21878c22fe49e7e4752eecaa36541.png',
                      width: 40,
                    )
                    // Icon(Icons.video_library_sharp)
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: InkWell(
                onTap: () {},
                child: Row(
                  children: [
                    Text('Short'),
                    Spacer(),
                    Icon(Icons.video_library_sharp)
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: InkWell(
                onTap: () {},
                child: Row(
                  children: [
                    Text('Short'),
                    Spacer(),
                    Icon(Icons.video_library_sharp)
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: TextButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                child: Text('Logout'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
