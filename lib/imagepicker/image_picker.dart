import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MyImagePicker extends StatefulWidget {
  @override
  _MyImagePickerState createState() => _MyImagePickerState();
}

class _MyImagePickerState extends State<MyImagePicker> {
  PickedFile _image;

  _imgFromCamera() async {
    PickedFile image = await ImagePicker()
        .getImage(source: ImageSource.camera, imageQuality: 50);
    setState(() {
      _image = image;
    });
  }

  _imgFromGallery() async {
    PickedFile image = await ImagePicker()
        .getImage(source: ImageSource.gallery, imageQuality: 50);
    setState(() {
      _image = image;
      image.readAsBytes();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image Picker"),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              width: 200,
              height: 200,
              child: (_image != null)
                  ? Image.file(File(_image.path))
                  : Icon(
                      Icons.image,
                      size: 100,
                    ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: Icon(Icons.camera_alt),
                  onPressed: () {
                    _imgFromCamera();
                  },
                ),
                IconButton(
                  icon: Icon(Icons.image),
                  onPressed: () {
                    _imgFromGallery();
                  },
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(left: 30,right: 30),
              child: ElevatedButton(
                child: Text("Upload Me"),
                onPressed: (){
                  _upload(_image);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _upload(PickedFile file) {
    final bytes = File(file.path).readAsBytesSync();
    String img64 = base64Encode(bytes);
    print(img64.length);
  }
}
