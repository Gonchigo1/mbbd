import 'package:bd1/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'home.dart';
import 'package:bd1/components/square_tile.dart';
import 'package:bd1/profile.dart';


class SignUp extends StatefulWidget {
  
  const SignUp({Key? key});

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String email = "", password = "", name = "", phone = "";
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController mailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    passwordController.dispose();
    mailController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();

  Future<void> addUserDetails(String name, String mail, String phone) async {
    await FirebaseFirestore.instance.collection('users').add({
      'Name': name,
      'E-mail': mail,
      'Phone Number': phone,
    });
  }

  registration() async {
    if (password != null &&
        nameController.text != "" &&
        mailController.text != "") {
      try {
        UserCredential userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        await addUserDetails(
          nameController.text.trim(),
          mailController.text.trim(),
          phoneController.text.trim(),
        );



        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Registered successfully',
              style: TextStyle(fontSize: 20.0),
            ),
          ),
        );


         // Navigate to the profile page and pass user details
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ProfilePage(
                
          ),
        ),
      );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.orangeAccent,
              content: Text(
                "password is too weak",
                style: TextStyle(fontSize: 20.0),
              ),
            ),
          );
        } else if (e.code == "email-already-in-use") {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.orangeAccent,
              content: Text(
                "account already exists",
                style: TextStyle(fontSize: 18.0),
              ),
            ),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SquareTile(imagePath: 'assets/image.jpg'),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Бүртгүүлэх',
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a name!';
                      }
                      return null;
                    },
                    controller: nameController,
                    decoration: InputDecoration(
                      hintText: 'Нэр',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter an email!';
                      }
                      return null;
                    },
                    controller: mailController,
                    decoration: InputDecoration(
                      hintText: 'И-мэйл хаяг',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) => email = value,
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a phone!';
                      }
                      return null;
                    },
                    controller: phoneController,
                    decoration: InputDecoration(
                      hintText: 'Гар утасны дугаар',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) => phone = value,
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a password!';
                      }
                      return null;
                    },
                    controller: passwordController,
                    decoration: InputDecoration(
                      hintText: 'Нууц үг',
                      border: OutlineInputBorder(),
                    ),
                    obscureText: true,
                    onChanged: (value) => password = value,
                  ),
                  const SizedBox(height: 15.0),
                  ElevatedButton(
                    onPressed: registration,
                    child: const Text(
                      "Бүртгүүлэх",
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}