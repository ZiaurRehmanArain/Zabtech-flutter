import 'dart:io';

import 'package:database/LoginView.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class SignUpView extends StatefulWidget {
  SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  createAcount(BuildContext context) async {
    final credential = FirebaseAuth.instance;
    credential
        .createUserWithEmailAndPassword(
            email: email.text, password: password.text)
        .then((user) async {
      print('account createde');

      DatabaseReference ref =
          FirebaseDatabase.instance.ref('users/${user.user!.uid}');
      await ref.set({
        'uid': user.user!.uid,
        "name": name.text,
        "email": email.text,
        'phone_number': phone.text,
        'profileImage':imageUrl
      });
      debugPrint(user.user!.email);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginView()));
    }).catchError((e) {
      debugPrint(e.toString());
    });
  }

  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();

  TextEditingController name = TextEditingController();

  TextEditingController phone = TextEditingController();

  late String imagePath = '', imageName, imageUrl;
  bool loading = false;

  cameraImagePicker() async {
    final ImagePicker _picker = ImagePicker();

    final _image = await _picker.pickImage(source: ImageSource.camera);
    print(_image!.path);
    setState(() {
      imagePath = _image.path;
      imageName = _image.name;
    });
  }

  galleryImagePicker() async {
    final ImagePicker _picker = ImagePicker();

    final _image = await _picker.pickImage(source: ImageSource.gallery);
    print(_image!.path);
    setState(() {
      imagePath = _image.path;
      imageName = _image.name;
    });
  }

  ImageUpload() async {
    setState(() {
      loading = true;
    });

    File file = File(imagePath);

    final storageRef = FirebaseStorage.instance.ref();
    final imagesRef = storageRef.child("images/$imageName");

    await imagesRef.putFile(file).then((p) async {
       imageUrl = await imagesRef.getDownloadURL();
      print('image uploaded  $imageUrl');
      setState(() {
        // imageUrl = url;
        loading = false;
      });
    }).catchError((onError) {
      setState(() {
        loading = false;
      });
      print(onError);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Sign Up'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              children: [
                TextField(
                  controller: name,
                  decoration: InputDecoration(hintText: 'Name'),
                ),
                TextField(
                  controller: email,
                  decoration: InputDecoration(hintText: 'Email'),
                ),
                TextField(
                  controller: password,
                  decoration: InputDecoration(hintText: 'Password'),
                ),
                TextField(
                  controller: phone,
                  decoration: InputDecoration(hintText: 'Phone number'),
                ),
                imagePath == '' || imagePath.isEmpty
                    ? Text('no image')
                    : Image.file(
                        File(imagePath),
                        width: 100,
                      ),
                Container(
                    margin: EdgeInsets.all(10),
                    height: 40,
                    width: MediaQuery.of(context).size.width * .8,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    child: ElevatedButton(
                        onPressed: () {
                          cameraImagePicker();
                        },
                        child: Text('camera'))),
                Container(
                    margin: EdgeInsets.all(10),
                    height: 40,
                    width: MediaQuery.of(context).size.width * .8,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    child: ElevatedButton(
                        onPressed: () {
                          galleryImagePicker();
                        },
                        child: Text('Gallery'))),
                Container(
                  margin: EdgeInsets.all(10),
                  height: 40,
                  width: MediaQuery.of(context).size.width * .8,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  child: ElevatedButton(
                      onPressed: () {
                        // print(email.text);
                        createAcount(context);
                      },
                      child: Text('Sign Up')),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account?"),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginView()));
                        },
                        child: Text('Login ')),
                  ],
                ),
                ElevatedButton(
                    onPressed: () {
                      ImageUpload();
                    },
                    child:
                        loading ? CircularProgressIndicator() : Text('uplaod'))
              ],
            ),
          ),
        ));
  }
}
