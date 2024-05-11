import 'package:bd1/home.dart';
import 'package:bd1/main.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  XFile? _image;
  bool _isGallerySelected = true;

  // TextEditingController _nameController = TextEditingController();
  // TextEditingController _emailController = TextEditingController();
  // TextEditingController _phoneController = TextEditingController();

  Future getImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(
        source: _isGallerySelected ? ImageSource.gallery : ImageSource.camera);
    if (image == null) return;

    setState(() {
      _image = image;
    });
  }

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _saveChanges() async {
    if (_image != null) {
      try {
        String imageURL = await uploadImageToFirestore(_image!.path);
        if (imageURL.isNotEmpty) {
          saveProfileToFirestore(imageURL);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Image saved successfully'),
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Error uploading image'),
            ),
          );
        }
      } catch (e) {
        print('Error saving image: $e');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error saving image'),
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('No image selected'),
        ),
      );
    }
  }

  Future<String> uploadImageToFirestore(String imagePath) async {
    try {
      String imageName = imagePath.split('/').last;
      Reference ref = FirebaseStorage.instance
          .ref()
          .child('profile_images')
          .child(imageName);
      UploadTask uploadTask = ref.putFile(File(imagePath));
      TaskSnapshot snapshot = await uploadTask;
      String downloadURL = await snapshot.ref.getDownloadURL();
      return downloadURL;
    } catch (e) {
      print('Error uploading image to Firestore storage: $e');
      return '';
    }
  }

  void saveProfileToFirestore(String imageURL) async {
    try {
      CollectionReference profileCollection =
          FirebaseFirestore.instance.collection('profile');

      String userId = "unique_user_id";

      DocumentSnapshot snapshot = await profileCollection.doc(userId).get();
      if (snapshot.exists) {
        // Document exists, update it
        await profileCollection.doc(userId).update({
          'imageURL': imageURL,
        });
      } else {
        // Document doesn't exist, create it
        await profileCollection.doc(userId).set({
          'imageURL': imageURL,
        });
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Profile saved successfully'),
        ),
      );
    } catch (e) {
      print('Error saving profile to Firestore: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error saving profile'),
        ),
      );
    }
  }

  void _leaveApp() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginApp()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: false,
        titleSpacing: 0.0,
        title: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: const Text(
            "Хэрэглэгчийн мэдээлэл",
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(height: 20),
            Stack(
              children: [
                Container(
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(100.0),
                  ),
                  child: _image == null
                      ? Icon(Icons.account_circle,
                          size: 120, color: Colors.white)
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(100.0),
                          child: Image.file(
                            File(_image!.path),
                            fit: BoxFit.cover,
                          ),
                        ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: IconButton(
                    onPressed: getImage,
                    icon: Icon(Icons.photo_library),
                    color: Colors.white,
                    tooltip: 'Choose Image from Gallery',
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.only(top: 16, right: 16, left: 16),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      ' Хэрэглэгчийн мэдээлэл:',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      ' Хэрэглэгчийн И-мейл ' ' ${loggedInUserEmail ?? ""}' '\n амжилттай нэвтэрлээ.',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color.fromARGB(255, 4, 4, 4),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: _saveChanges,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue),
                foregroundColor: MaterialStateProperty.all(Colors.white),
                textStyle: MaterialStateProperty.all(TextStyle(fontSize: 15)),
                padding: MaterialStateProperty.all(
                    EdgeInsets.symmetric(horizontal: 15, vertical: 10)),
                shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              child: Text('Save Changes'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.home),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ),
                );
              },
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Text(
                    "Гарах",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 10),
                  ),
                ),
                IconButton(
                  alignment: Alignment.center,
                  icon: const Icon(Icons.exit_to_app_outlined),
                  onPressed: _leaveApp,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
