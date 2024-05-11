import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:bd1/confirm.dart';

class UnelgeePage extends StatefulWidget {
  @override
  _UnelgeePageState createState() => _UnelgeePageState();
}

class _UnelgeePageState extends State<UnelgeePage> {
  XFile? _image;
  TextEditingController vehicleNameController = TextEditingController();
  TextEditingController yearController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  TextEditingController estimatedPriceController = TextEditingController();
  TextEditingController aboutController = TextEditingController();


  Future getImage() async {
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
      print('image $image');
      if (image == null) return;

      setState(() {
        _image = image;
      });
    } catch (e) {
      print('get image error $e');
    }
  }

  Future getCameraImage() async {
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(source: ImageSource.camera);
      print('image $image');
      if (image == null) return;

      setState(() {
        _image = image;
      });
    } catch (e) {
      print('get camera image error $e');
    }
  }

  void uploadImage() {
    if (_image != null) {
      print('Uploading image...');
    } else {
      print('No image selected.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Үнэлгээ хийх'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Зураг сонгох",
              style: TextStyle(fontSize: 30),
              ),
                      

            _image == null
                ?const Text('No image selected.')
                : Container(
                    height: 200,
                    width: 200,
                    child: Image.file(
                      File(_image!.path),
                      fit: BoxFit.cover,
                    ),
                  ),
            Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: <Widget>[
    ElevatedButton(
      onPressed: getImage,
      child: Text('Gallery', style: TextStyle(fontSize: 15, color: Colors.white)),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        textStyle: TextStyle(fontSize: 16),
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
    SizedBox(width: 10),
    ElevatedButton(
      onPressed: getCameraImage,
      child: Text('Camera', style: TextStyle(fontSize: 15, color: Colors.white)),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        textStyle: TextStyle(fontSize: 16),
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
  ],
),

            Center(
              child: Container(
                margin: const EdgeInsets.all(10.0),
                color: Color.fromARGB(255, 216, 216, 216),
                width: 300.0,
                child: Column(
                  children: [
                    TextFormField(
                      controller: vehicleNameController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Тээврийн хэрэгслийн нэр',
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: yearController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Он',
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: typeController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Төрөл',
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: estimatedPriceController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Боломжит үнийн санал',
                      ),
                    ),
                    const SizedBox(height: 10),

                     TextFormField(
                      controller: aboutController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Дэлгэрэнгүй',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 5.0),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ConfirmPage(
                      imagePath: _image!.path,
                      vehicleName: vehicleNameController.text,
                      year: yearController.text,
                      type: typeController.text,
                      estimatedPrice: estimatedPriceController.text,
                      about: aboutController.text,
                    ),
                  ),
                );
              },
              child: Text(
                  "Дараагийн",
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
            ),
          ],
        ),
      ),
    );

  }
}