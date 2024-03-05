import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:listviewapp/wrap_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var img = [
    'assets/image/shoes.jpg',
    'assets/image/shoes.jpg',
    'assets/image/shoes.jpg',
    'assets/image/shoes.jpg',
  ];
  var val = 1.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Column(
        children: [
          // CarouselSlider(
          //   options: CarouselOptions(height: 200.0),
          //   items: [1, 2, 3, 4, 5].map((i) {
          //     return Builder(
          //       builder: (BuildContext context) {
          //         return Container(
          //             width: MediaQuery.of(context).size.width,
          //             margin: EdgeInsets.symmetric(horizontal: 5.0),
          //             decoration: BoxDecoration(color: Colors.amber),
          //             child: Text(
          //               'text $i',
          //               style: TextStyle(fontSize: 16.0),
          //             ));
          //       },
          //     );
          //   }).toList(),
          // ),
          SizedBox(
            height: 10,
          ),
          CarouselSlider(
            options: CarouselOptions(
              autoPlayCurve: Curves.easeInOutBack,
              autoPlayInterval: Duration(seconds: 1),
              scrollDirection: Axis.horizontal,
              height: 600.0,
              // reverse: true,
              autoPlay: true,
              enlargeCenterPage: true,
            ),
            items: img.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      // decoration: BoxDecoration(color: Colors.amber),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            img[0],
                            fit: BoxFit.cover,
                          )));
                },
              );
            }).toList(),
          ),
          // Slider(
          //     value: val,
          //     onChanged: (v) {
          //       val = v;
          //       setState(() {});
          //     }),
          Center(
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => WrapWidget()));
                  },
                  child: Text('login'))),
        ],
      ),
    );
  }
}
