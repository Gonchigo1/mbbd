import 'package:bd1/home.dart';
import 'package:bd1/profile.dart';
import 'package:bd1/selbeg.dart';
import 'package:bd1/zar.dart';
import 'package:flutter/material.dart';
// import 'package:bd1/profile.dart'; 

class basketPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Таны сагс",
        style: TextStyle(
                  fontSize: 18,
                ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Таны сагс хоосон байна',
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey[700],
                fontWeight: FontWeight.normal,
              ),
            ),
            SizedBox(
              width: 250,
              height: 250,
              child: Image.asset('assets/basket.png'),
              ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
           IconButton(
  icon: Icon(Icons.home),
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
    );
  },
),
 IconButton(
              icon: Icon(Icons.directions_car),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SelbegPage()),
                );
              },
            ),

            IconButton(
              icon: Icon(Icons.task), 
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ZarPage()),
                );
              },
              
            ),
            
            IconButton(
              icon: Icon(Icons.shopping_bag), 
                  iconSize: 40, 
                  color: Colors.blue,              
                  onPressed: () {
              },
            ),

            IconButton(
              icon: Icon(Icons.person),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage(
                  )), // Navigate to ProfilePage
                );
              },
            ),
            
          ],
        ),
      ),
    );
  }
}
