import 'package:flutter/material.dart';

class DetialScreen extends StatefulWidget {
  String img, title, des, price, cetagory;
  DetialScreen(
      {super.key,
      required this.title,
      required this.img,
      required this.des,
      required this.cetagory,
      required this.price});

  @override
  State<DetialScreen> createState() => _DetialScreenState();
}

class _DetialScreenState extends State<DetialScreen> {
  var seeMore = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network('${widget.img}'),
            Text(
              'Title : ${widget.title}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            seeMore?
          Column(children: [
              Container(
                width: MediaQuery.of(context).size.width * .8,
                child: Center(
                    child:
                    
                     Text(
                  '${widget.des}',
                  
                 
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ))),
            TextButton(
                onPressed: () {
                  seeMore = !seeMore;
                   setState(() {
                    
                  });
                },
                child: Text('Less')),
          ],):Column(children: [
              Container(
                width: MediaQuery.of(context).size.width * .8,
                child: Center(
                    child:
                    
                     Text(
                  '${widget.des}',
                   maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ))),
            TextButton(
                onPressed: () {
                  seeMore = !seeMore;
                  setState(() {
                    
                  });
                  
                },
                child: Text('See more')),
          ],),
            Text(
              '${widget.price}',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            Text(
              '${widget.cetagory}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
