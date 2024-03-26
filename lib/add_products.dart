import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddCardView extends StatefulWidget {
  AddCardView({super.key});

  @override
  State<AddCardView> createState() => _AddCardViewState();
}

class _AddCardViewState extends State<AddCardView> {
  TextEditingController name = TextEditingController();

  TextEditingController descrption = TextEditingController();

  TextEditingController price = TextEditingController();

  String? imagePath = "", imageName, downloadUrl;
  getImage() async {
    final ImagePicker _picker = ImagePicker();

    final _image = await _picker.pickImage(source: ImageSource.camera);
    print(_image!.path);
    setState(() {
      imagePath = _image.path;
      imageName = _image.name;
    });
  }

  imageUpload() async {
    final storageRef = FirebaseStorage.instance.ref("products_images");

    Reference? imagesRef = storageRef.child(imageName.toString());
    File file = File(imagePath.toString());

    await imagesRef.putFile(file).then((p0) async {
      downloadUrl = await imagesRef.getDownloadURL();
      setState(() {});
    }).catchError((onError) {
      print(onError);
    });
  }

  ProductSaveData() async {
    var uid = DateTime.now().millisecondsSinceEpoch;
    print(uid);
    await imageUpload();
    DatabaseReference ref = FirebaseDatabase.instance.ref("products");

    await ref
        .child(uid.toString())
        .set({
          "name": name.text,
          "description": descrption.text,
          "price": price.text,
          'product_image':downloadUrl,
          uid: uid.toString()
        })
        .then((value) => print('data add'))
        .catchError((onError) => print(onError));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: name,
              decoration: InputDecoration(hintText: 'enter name'),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: descrption,
              decoration: InputDecoration(hintText: 'enter descrption'),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: price,
              decoration: InputDecoration(hintText: 'enter price'),
            ),
            SizedBox(
              height: 10,
            ),
            imagePath == "" || imagePath.toString().isEmpty
                ? Text('No image')
                : Image.file(
                    File(imagePath.toString()),
                    width: 100,
                  ),
            ElevatedButton(
                onPressed: () {
                  getImage();
                },
                child: Text('get image')),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  ProductSaveData();
                },
                child: Text('submit'))
          ],
        ),
      ),
    );
  }
}
