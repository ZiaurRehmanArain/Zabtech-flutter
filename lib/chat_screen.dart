import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  var userChat = [
    {'sendme': true, 'message': 'text message'},
    {'sendme': true, 'message': 'text message'},
    {'sendme': false, 'message': 'text message'},
    {'sendme': true, 'message': 'text message'},
    {'sendme': false, 'message': 'text message'},
    {'sendme': true, 'message': 'text message'},
    {'sendme': true, 'message': 'text message'},
    {'sendme': false, 'message': 'text message'},
    {'sendme': true, 'message': 'text message'},
    {'sendme': false, 'message': 'text message'},
    {'sendme': true, 'message': 'text message'},
    {'sendme': true, 'message': 'text message'},
    {'sendme': false, 'message': 'text message'},
    {'sendme': true, 'message': 'text message'},
    {'sendme': false, 'message': 'text message'},
    {'sendme': true, 'message': 'text message'},
    {'sendme': true, 'message': 'text message'},
    {'sendme': false, 'message': 'text message'},
    {'sendme': true, 'message': 'text message'},
    {'sendme': false, 'message': 'text message'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: userChat.length,
        itemBuilder: (BuildContext context, index) {
          if (userChat[index]['sendme'] == true) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Card(
                  child: Text(userChat[index]['message'].toString()),
                )
              ],
            );
          }else{
              return Row(
              children: [
                Card(
                  child: Text(userChat[index]['message'].toString()),
                )
              ],
            );
          }
        },
      ),
    );
  }
}
