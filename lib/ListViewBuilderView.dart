import 'package:flutter/material.dart';

class ListViewBuilder extends StatelessWidget {
  ListViewBuilder({super.key});
  var userData = [
    {
      "name": "first",
      "description": "product des",
      'price':'5000',
      'img':
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRsBBSIUkSdxKAwUor44B1w7AHjJyCBJGEAb7JpLz2cgA&s",
    },
    {
      "name": "Second",
      "description": "product des 2",
      'price':'6000',
      'img':
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRsBBSIUkSdxKAwUor44B1w7AHjJyCBJGEAb7JpLz2cgA&s",
    },
    {
      "name": "third",
      "description": "product des",
      'price':'4000',
      'img':
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRsBBSIUkSdxKAwUor44B1w7AHjJyCBJGEAb7JpLz2cgA&s",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('List view builder'),
        ),
        body: ListView.builder(
            itemCount: userData.length,
            itemBuilder: (context, index) {
              return Card(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                    leading: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'assets/image/shoes.jpg',
                          // fit: BoxFit.cover,
                          height: double.infinity,
                        )

                        // Image.network(
                        //     'https://comradeweb.com/wp-content/uploads/2022/06/The-Best-Shoe-eCommerce-Website-Designs.jpg')),
                        ),
                    title: Text(userData[index]['name'].toString()),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Rs :5000'),
                        Text('description'),
                        Container(
                          width: 100,
                          child: Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 15,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 15,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 15,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 15,
                              ),
                              Icon(
                                Icons.star,
                                size: 15,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    trailing: Icon(Icons.arrow_forward_ios_outlined)),
              ));
            }));
  }
}
