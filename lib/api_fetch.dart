import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyApiFetchScreen extends StatefulWidget {
  @override
  _MyApiFetchScreenState createState() => _MyApiFetchScreenState();
}

class _MyApiFetchScreenState extends State<MyApiFetchScreen> {
  // Define the API endpoint URL
  final String apiUrl = 'https://jsonplaceholder.typicode.com/posts/1';

  // Function to fetch data from the API
  Future<Map<String, dynamic>> fetchData() async {
    // Make the HTTP request
    final response = await http.get(Uri.parse(apiUrl));

    // Check if the request was successful
    if (response.statusCode == 200) {
      // Parse the JSON response
      var data = json.decode(response.body);
      print(data);
      return data;
    } else {
      // If the request was not successful, throw an exception
      throw Exception('Failed to load data from the API');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('API Fetch Example'),
      ),
      body: FutureBuilder(
        // Use the FutureBuilder widget to handle the async operation
        future: fetchData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Display a loading indicator while waiting for the data
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            // Display an error message if the request fails
            return Text('Error: ${snapshot.error}');
          } else {
            // Display the fetched data
            return Center(
              child: Text('API Data: ${snapshot.data!['title']}'),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          fetchData();
        },
        child: Text('fetch data'),
      ),
    );
  }
}
