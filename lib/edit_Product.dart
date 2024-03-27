import 'dart:io';

import 'package:database/adminView.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditCardView extends StatefulWidget {
  String uid, name, des, price;
  EditCardView(
      {super.key,
      required this.name,
      required this.des,
      required this.price,
      required this.uid});

  @override
  State<EditCardView> createState() => _EditCardViewState();
}

class _EditCardViewState extends State<EditCardView> {
  TextEditingController name = TextEditingController();

  TextEditingController descrption = TextEditingController();

  TextEditingController price = TextEditingController();

  String? imagePath = "", imageName, downloadUrl;
  bool loading = false;
  // getImage() async {
  //   final ImagePicker _picker = ImagePicker();

  //   final _image = await _picker.pickImage(source: ImageSource.camera);
  //   print(_image!.path);
  //   setState(() {
  //     imagePath = _image.path;
  //     imageName = _image.name;
  //   });
  // }

  // imageUpload() async {
  //   final storageRef = FirebaseStorage.instance.ref("products_images");

  //   Reference? imagesRef = storageRef.child(imageName.toString());
  //   File file = File(imagePath.toString());

  //   await imagesRef.putFile(file).then((p0) async {
  //     downloadUrl = await imagesRef.getDownloadURL();
  //     setState(() {});
  //   }).catchError((onError) {
  //     print(onError);
  //   });
  // }
  @override
  void initState() {
    super.initState();
    name.text = widget.name;
    descrption.text = widget.des;
    price.text = widget.price;
  }

  ProductUpdateData() async {
    loading = true;
    setState(() {});
    // var uid = DateTime.now().millisecondsSinceEpoch;
    // print(uid);
    // await imageUpload();
    DatabaseReference ref = FirebaseDatabase.instance.ref("products");

    await ref.child(widget.uid).update({
      "name": name.text,
      "description": descrption.text,
      "price": price.text,
    }).then((value) {
      print('data add');
      loading = false;
      setState(() {});

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => AdminView()));
    }).catchError((onError) {
      print(onError);
      loading = false;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add product'),
      ),
      body: SingleChildScrollView(
        child: Padding(
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
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(hintText: 'enter price'),
              ),
              SizedBox(
                height: 10,
              ),
              // imagePath == "" || imagePath.toString().isEmpty
              //     ? Text('No image')
              //     : Image.file(
              //         File(imagePath.toString()),
              //         width: 100,
              //       ),
              // ElevatedButton(
              //     onPressed: () {
              //       getImage();
              //     },
              //     child: Text('get image')),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    ProductUpdateData();
                  },
                  child: loading ? CircularProgressIndicator() : Text('submit'))
            ],
          ),
        ),
      ),
    );
  }
}
