import 'package:bd1/unelgee.dart';
import 'package:flutter/material.dart';
import 'package:bd1/basket.dart';
import 'package:bd1/home.dart';
import 'package:bd1/profile.dart';
import 'package:bd1/selbeg.dart';
// import 'package:bd1/login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ZarPage extends StatelessWidget {
  const ZarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Таны зар"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 20),
            Text(
              'Таны зарын жагсаалт',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: StreamBuilder(
                stream: FirebaseFirestore.instance.collection('unelgee').snapshots(),
                builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  }
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                      return CircularProgressIndicator();
                    default:
                      return ListView(
                        children: snapshot.data!.docs.map((DocumentSnapshot document) {
                          Map<String, dynamic> data = document.data() as Map<String, dynamic>;
                          final imageURL = data['imageURL'] as String?;

                          return Container(
                            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 69, 140, 255),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (imageURL != null)
                                  Image.network(
                                    imageURL,
                                    height: 200,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                SizedBox(height: 10),
                                Text(
                                  'Машины нэр: ${data['vehicleName']}',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text('Үйлдвэрлэсэн он: ${data['year']}'),
                                Text('Төрөл: ${data['type']}'),
                                Text('Боломжит үнийн санал: ${data['estimatedPrice']}'),
                                Text('Автомашины дэлгэрэнгүй: ${data['about']}'),

                              ],
                            ),
                          );
                        }).toList(),
                      );
                  }
                },
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UnelgeePage()),
                );
              },
              child: Text(
                "Зар оруулах",
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
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
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
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
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SelbegPage()),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.local_offer),
              iconSize: 40,
              color: Colors.blue,
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.shopping_cart),
              
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => basketPage()),
                );
              },
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfilePage(),
                  ),
                );
              },
              child: Row(
                children: [
                  Icon(Icons.person),
                  SizedBox(width: 8),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
