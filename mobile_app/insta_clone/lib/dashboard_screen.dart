import 'dart:convert';
import 'dart:developer';

import 'package:path/path.dart';
import 'package:async/async.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  List<String> itemsName = [];
  File _image;
  final picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    setState(() {
      this.itemsName = [];
    });
  }

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
      ),
      body: Center(
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          FlatButton(
            color: Colors.amber,
            onPressed: () {
              getImage().then((val) {
                Upload(_image);
              });
            },
            child: Text("Select Image"),
          ),
          _image != null ? Image.file(_image) : Text("Empty"),
          Expanded(
            child: ListView.builder(
                shrinkWrap: true, //just set this property
                itemCount: this.itemsName.length,
                itemBuilder: (context, itemIndex) {
                  String name = this.itemsName[itemIndex];
                  return Container(
                    child: Text("Name : $name"),
                  );
                }),
          )
        ]),
      ),
    );
  }

  void getResponseFromServer() {}

  Upload(File imageFile) async {
    var uploadURL =
        "http://ec2-52-19-185-105.eu-west-1.compute.amazonaws.com:5000/api/identify_objects";
    var stream =
        new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
    var length = await imageFile.length();

    var uri = Uri.parse(uploadURL);

    var request = new http.MultipartRequest("POST", uri);
    var multipartFile = new http.MultipartFile('image', stream, length,
        filename: basename(imageFile.path));
    //contentType: new MediaType('image', 'png'));

    request.files.add(multipartFile);
    var response = await request.send();
    print(response.statusCode);
    response.stream.transform(utf8.decoder).listen((value) {
      var resonseObject = jsonDecode(value);
      setState(() {
        itemsName.clear();
      });

      for (var item in resonseObject["result"]) {
        setState(() {
          itemsName.add("${item["entity"]} - ${item["score"]}");
        });
      }
    });
  }
}
