import 'dart:io';
import 'package:bd1/zar.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ConfirmPage extends StatelessWidget {
  final String imagePath;
  final String vehicleName;
  final String year;
  final String type;
  final String estimatedPrice;
  final String about;

  ConfirmPage({
    required this.imagePath,
    required this.vehicleName,
    required this.year,
    required this.type,
    required this.estimatedPrice,
    required this.about,

  });

  Future<String> uploadImageToFirestore(String imagePath) async {
    try {
      String imageName = imagePath.split('/').last;
      Reference ref = FirebaseStorage.instance.ref().child('images').child(imageName);
      UploadTask uploadTask = ref.putFile(File(imagePath));
      TaskSnapshot snapshot = await uploadTask;
      String downloadURL = await snapshot.ref.getDownloadURL();
      return downloadURL;
    } catch (e) {
      print('Error uploading image to Firestore storage: $e');
      return ''; 
    }
  }

  void saveDataToFirestore(String imagePath, String vehicleName, String year, String type, String estimatedPrice) async {
    try {
      String downloadURL = await uploadImageToFirestore(imagePath);

      String collectionId = "unelgee";
      String documentId = "unelgee"; 

      FirebaseFirestore firestore = FirebaseFirestore.instance;

      await firestore.collection(collectionId).doc(documentId).set({
        'imageURL': downloadURL,
        'vehicleName': vehicleName,
        'year': year,
        'type': type,
        'estimatedPrice': estimatedPrice,
        'about': about,
      });

      print('Data saved to Firestore successfully');
    } catch (e) {
      print('Error saving data to Firestore: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Мэдээллийг баталгаажуулах"),
      ),
      body: Center(
        
        child: Container(
          
          margin: EdgeInsets.all(20.0),
          padding: EdgeInsets.all(20.0),
          
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 15,
                offset: Offset(0, 1), 
              ),
            ],
          ),
          child: Column(
          
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
              
                height: 300,
                width: 300,
                child: Image.file(
                  File(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 20),
              Text('Тээврийн хэрэгслийн нэр: $vehicleName', textAlign: TextAlign.right,style: TextStyle(fontSize: 14, color: const Color.fromARGB(255, 0, 0, 0))),
              Text('Он: $year', textAlign: TextAlign.right,style: TextStyle(fontSize: 14, color: const Color.fromARGB(255, 0, 0, 0))),
              Text('Төрөл: $type', textAlign: TextAlign.right,style: TextStyle(fontSize: 14, color: const Color.fromARGB(255, 0, 0, 0))),
              Text('Боломжит үнийн санал: $estimatedPrice', textAlign: TextAlign.right,style: TextStyle(fontSize: 14, color: const Color.fromARGB(255, 0, 0, 0))),
              Text('Автомашины дэлгэрэнгүй: $about', textAlign: TextAlign.right,style: TextStyle(fontSize: 14, color: const Color.fromARGB(255, 0, 0, 0))),

              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); 
                },
                child: Text('Засах', style: TextStyle(fontSize: 15, color: Colors.white)),
                style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                textStyle: TextStyle(fontSize: 16),
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  saveDataToFirestore(imagePath, vehicleName, year, type, estimatedPrice);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ZarPage()),
                  );
                },
                child: Text('Дуусгах', style: TextStyle(fontSize: 15, color: Colors.white)),
                style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                textStyle: TextStyle(fontSize: 16),
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),


              ),


      // ElevatedButton(
      // onPressed: getImage,
      // child: Text('Gallery', style: TextStyle(fontSize: 15, color: Colors.white)),
      // style: ElevatedButton.styleFrom(
      //   backgroundColor: Colors.blue,
      //   textStyle: TextStyle(fontSize: 16),
      //   padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      //   shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.circular(10),
      //   ),
      // ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
