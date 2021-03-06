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

  //this is a code get image from Camera
  _imgFromCamera() async {
    PickedFile image = await ImagePicker()
        .getImage(source: ImageSource.camera, imageQuality: 50);
    setState(() {
      _image = image;
    });
  }

  //this is a code get image from Gallery
  _imgFromGallery() async {
    PickedFile image = await ImagePicker()
        .getImage(source: ImageSource.gallery, imageQuality: 50);
    setState(() {
      _image = image;
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
            //this is a container that contain image
            //when user select image from Gallery or Camera
            Container(
              margin: EdgeInsets.only(top: 20),
              width: 300,
              height: 300,
              child: (_image != null)
                  ? Image.file(File(_image.path),fit: BoxFit.cover,)
                  : Icon(
                      Icons.image,
                      size: 300,
                    ),
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              //this is used to provide space between icons
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //this widget is used to get image from
                //Camera
                IconButton(
                  icon: Icon(Icons.camera_alt,size: 50,),
                  onPressed: () {
                    _imgFromCamera();
                  },
                ),
                //this widget is used to get image from
                //Gallery
                IconButton(
                  icon: Icon(Icons.image,size: 50,),
                  onPressed: () {
                    _imgFromGallery();
                  },
                ),
              ],
            ),
            //this widget provide space in vertical
            SizedBox(
              height: 50,
            ),
            //this is used to perform uploading task
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(left: 30, right: 30),
              //this is a button that has event to perform action
              child: ElevatedButton(
                child: Text("Upload Me"),
                onPressed: () {
                  //upload method calling from here
                  _upload(_image);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // this method is used to convert image into String
  // and you can write uploading code here
  void _upload(PickedFile file) {
    final bytes = File(file.path).readAsBytesSync();
    String img64 = base64Encode(bytes);
    print(img64.length);
  }
}
