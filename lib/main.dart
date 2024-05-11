import 'package:bd1/forget_password.dart';
import 'package:bd1/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:bd1/home.dart';
String? loggedInUserEmail;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(LoginApp());
}

class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Нэвтрэх',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: Color.fromARGB(255, 255, 255, 255),
        padding:
            const EdgeInsets.only(top: 10, left: 30, right: 30, bottom: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 200,
              height: 200,
              child: Image.asset('assets/qwe.png'),
            ),
            const Text(
              "Нэвтрэх",
              style: TextStyle(fontSize: 30),
            ),
            const SizedBox(height: 20.0),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'И-мейл хаяг',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10.0),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Нууц үг',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
              const SizedBox(height: 15.0),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ForgotPasswordPage()),
                );
              },
            child: const Text(
                "Forgot Password?",
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 14,
                  decoration: TextDecoration.none,
                ),
              ),



            ),
            const SizedBox(height: 15.0),
            ElevatedButton(
              onPressed: () {
                signInWithEmailAndPassword();
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Container(
                width: 140,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 0, 0, 0),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    "Нэвтрэх",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15.0),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUp()),
                );
              },
              child: const Text(
                "Бүртгүүлэх",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.blue,
                   ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> signInWithEmailAndPassword() async {
    
  try {
    // UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
    //   email: _emailController.text.trim(),
    //   password: _passwordController.text.trim(),
    // );
    // Store the logged-in user's email
    loggedInUserEmail = _emailController.text.trim();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Logged in successfully',
          style: TextStyle(fontSize: 15.0),
        ),
      ),
    );
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
    );
  } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.orangeAccent,
            content: Text(
              "User not found",
              style: TextStyle(fontSize: 15.0),
            ),
          ),
        );
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.orangeAccent,
            content: Text(
              "Password is not can be empty!",
              style: TextStyle(fontSize: 15.0),
            ),
          ),
        );
      }
    }
  }
}