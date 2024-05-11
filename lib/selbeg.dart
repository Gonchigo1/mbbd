import 'package:flutter/material.dart';
import 'package:bd1/basket.dart';
import 'package:bd1/book_selbeg.dart';
import 'package:bd1/selbeg_widget.dart';
import 'package:bd1/data_selbeg.dart';
import 'package:bd1/home.dart';
import 'package:bd1/profile.dart'; 
import 'package:bd1/zar.dart';

class SelbegPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Сэлбэгийн жагсаалт",
          style: TextStyle(
            color: Colors.grey[700],
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 10),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 5, right: 16, left: 16, bottom: 6),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Сэлбэг хайх",
                    hintStyle: const TextStyle(fontSize: 17),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                    filled: true,
                    fillColor: const Color.fromARGB(255, 255, 255, 255),
                    contentPadding: const EdgeInsets.only(left: 30),
                    suffixIcon: const Padding(
                      padding: EdgeInsets.only(right: 24, left: 16),
                      child: Icon(
                        Icons.search,
                        color: Colors.black,
                        size: 24,
                      ),
                    ),
                  ),
                  onChanged: (value) {},
                ),
              ),
            ),
            Expanded(
              child: GridView.count(
                padding: EdgeInsets.all(24.0),
                physics: const BouncingScrollPhysics(),
                childAspectRatio: 100 / 140,
                crossAxisCount: 2,
                crossAxisSpacing: 5,
                mainAxisSpacing: 15,
                children: getSelbegList().map((item) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BookSelbeg(selbeg: item)),
                      );
                    },
                    child: buildCar1(item, 16),
                  );
                }).toList(),
              ),
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
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.settings),
                  iconSize: 40,
                  color: Colors.blue,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SelbegPage()),
                    );
                  },
                ),
              ],
            ),
            IconButton(
              icon: Icon(Icons.local_offer),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ZarPage()),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.shopping_cart),
              
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
                    builder: (context) => ProfilePage(
                    ),
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
