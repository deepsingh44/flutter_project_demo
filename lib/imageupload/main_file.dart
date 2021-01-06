import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyUpload());
}

class MyUpload extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Upload Image"),
        ),
        body: MyWidget(),
      ),
    );
  }
}

class MyWidget extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  PickedFile _image;

  //this is a code get image from Camera
  _imgFromCamera() async {
    PickedFile image = await ImagePicker()
        .getImage(source: ImageSource.camera, imageQuality: 50);
    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            child: _image == null
                ? Icon(
                    Icons.image,
                    size: 200,
                  )
                : Image.file(
                    File(_image.path),
                    width: 200,
                    height: 200,
                  ),
          ),
          IconButton(
            onPressed: () {
              _imgFromCamera();
            },
            icon: Icon(Icons.camera_alt),
          ),
          ElevatedButton(
            child: Text("Upload"),
            onPressed: () {
              uploadImage(_image.path).then((value) => {
                    print("Successfully "),
                  });
            },
          ),
        ],
      ),
    );
  }

  Future<String> uploadImage(filename) async {
    var request = http.MultipartRequest('POST',
        Uri.parse("http://192.168.0.12:9876/FlutterWebServices/person"));
    request.files.add(await http.MultipartFile.fromPath('picture', filename));
    var res = await request.send();
    return res.reasonPhrase;
  }
}
