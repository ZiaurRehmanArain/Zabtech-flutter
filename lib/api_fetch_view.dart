import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiFetchView extends StatelessWidget {
  const ApiFetchView({super.key});
  fetchData() async {
    print('call');
    var response =
        await http.get(Uri.parse('https://fakestoreapi.com/products'));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data);
      return data;
    } else {
      throw Exception('Failed to load product');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: fetchData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Text('Not load data');
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, index) {
                return Card(
                  child: Row(
                    children: [
                      Image.network(
                        '${snapshot.data[index]['image']}',
                        height: 100,
                        width: 100,
                        fit: BoxFit.fill,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 40,
                            width: MediaQuery.of(context).size.width*.4,
                            child: Text('Title ${snapshot.data[index]['title']}',overflow: TextOverflow.ellipsis,)),
                          Container(
                            height: 40,

                            width: MediaQuery.of(context).size.width*.4,

                            child: Text(
                                'description ${snapshot.data[index]['description']}'),
                          ),
                          Text('category ${snapshot.data[index]['category']}'),
                          Text('price ${snapshot.data[index]['price']}')
                        ],
                      )
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          fetchData();
        },
        child: Text('data '),
      ),
    );
  }
}
