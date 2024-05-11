import 'package:bd1/available_selbeg.dart';
import 'package:bd1/book_selbeg.dart';
import 'package:flutter/material.dart';
import 'package:bd1/available_cars.dart';
import 'package:bd1/book_car.dart';
import 'package:bd1/data.dart';
import 'package:bd1/unelgee.dart';
import 'package:bd1/basket.dart';
import 'package:bd1/profile.dart'; 
import 'package:bd1/selbeg.dart';
import 'package:bd1/zar.dart';
import 'package:bd1/main.dart';
import 'package:bd1/data_selbeg.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Car> cars = getCarList();

  List<Selbeg> selbeg = getSelbegList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: Colors.blue, 
        centerTitle: false,
        titleSpacing: 0.0,
        elevation: 10,
        leading: Container(
          padding: const EdgeInsets.only(left: 20, top: 3, bottom: 3),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            },
            child: Image.asset('assets/profile.png'),
          ),
        ),
        title: Transform(
          transform: Matrix4.translationValues(15.0, 0.0, 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Сайн байна уу?",
                style: TextStyle(
                  fontSize: 15,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              Text(
                loggedInUserEmail ?? "", 
                style: TextStyle(
                  fontSize: 15,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 5),
          //   child: IconButton(
          //     icon: const Icon(Icons.search),
          //     onPressed: () {
          //       // Perform search action here
          //     },
          //   ),
          // ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 5,),
            const Padding(
              padding: EdgeInsets.only(top: 10, left: 20),
              child: Text(
                "Автомашин хайх",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 10),
              child: Padding(
                padding: const EdgeInsets.only(top: 5, right: 16, left: 16, bottom: 16),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Хайх",
                    hintStyle: const TextStyle(fontSize: 14),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      )
                    ),
                    filled: true,
                    fillColor: Colors.grey[100],
                    contentPadding: const EdgeInsets.only(left: 30),
                    suffixIcon: const Padding(
                      padding: EdgeInsets.only(right: 24, left: 16),
                      child: Icon(
                        Icons.search,
                        color: Colors.black,
                        size: 24,
                      ),
                    )
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Үнэлгээний зар",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AvailableCars())
                      );
                    },
                    child: const Row(
                      children: [
                        Text(
                          'бүгдийг үзэх',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                        SizedBox(width: 8),
                        Icon(
                          Icons.arrow_forward_ios,
                          size:12,
                          color: Colors.blue,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
             
             SizedBox(
              height: 280,
              child: ListView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: buildDeals(),
              ),
            ),
         
            Padding(
              padding: EdgeInsets.only(top: 16, right: 16, left: 16),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => UnelgeePage()),
                  );
                },
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  padding: EdgeInsets.all(15),
                  height: 50,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Авто машинаа үнэлүүлэх",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: const Color.fromARGB(255, 255, 255, 255),
                            ),
                          ),
                        ],
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                      ),
                    ],
                    
                  ),
                  
                ),
                
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Сэлбэгийн зар",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AvailableSelbeg())
                      );
                    },
                    child: const Row(
                      children: [
                        Text(
                          'бүгдийг үзэх',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                        SizedBox(width: 8),
                        Icon(
                          Icons.arrow_forward_ios,
                          size:12,
                          color: Colors.blue,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              
            ),
            
               SizedBox(
              height: 280,
              child: ListView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: buildDeals1(),
              ),
            ),
            
            SizedBox(height: 20),
          ],
          
        ),
        
      ),

      bottomNavigationBar: BottomAppBar(
        
        child: Row(
          
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.home),
                  iconSize: 40, 
                  color: Colors.blue,
                  onPressed: () {},
                ),
              ],
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
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ZarPage()),
                );
              },
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
            Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.person),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProfilePage(          
                      )),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> buildDeals() {
    List<Widget> list = [];
    for (var i = 0; i < cars.length; i++) {
      list.add(
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => BookCar(car: cars[i])),
            );
          },
          child: buildCar(cars[i], i),
        ),
      );
    }
    return list;
  }
  
   List<Widget> buildDeals1() {
    List<Widget> list = [];
    for (var i = 0; i < selbeg.length; i++) {
      list.add(
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => BookSelbeg(selbeg: selbeg[i])),
            );
          },
          child: buildSelbeg(selbeg[i], i),
        ),
      );
    }
    return list;
  }




  Widget buildCar(Car car, int index){
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 180, 178, 178),
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      padding: const EdgeInsets.all(16),
      margin: EdgeInsets.only(right: 16, left: index == 0 ? 16 : 0),
      width: 220,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            children: [
              Container(
                color: Color.fromARGB(255, 117, 116, 114),
                height: 100,
                child: Center(
                  child: Image.asset(
                    'assets/${car.images[0]}',
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    child: Text(
                      car.condition,
                      style: const TextStyle(
                        color: Color.fromARGB(255, 252, 247, 247),
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            car.brand,
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 8),
          Text(
            car.model,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              height: 1,
            ),
          ),
          Text(
            (car.condition == "Daily" ? "Өдрийн" : car.condition == "Weekly" ? "Долоо хоногийн" : "Сарын") + " өмнө",
            style: const TextStyle(
              fontSize: 10,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ),
        ],
      ),
    );
  }



  Widget buildSelbeg(Selbeg selbeg, int index){
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 180, 178, 178),
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      padding: const EdgeInsets.all(16),
      margin: EdgeInsets.only(right: 16, left: index == 0 ? 20 : 0),
      width: 220,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            children: [
              Container(
                color: Color.fromARGB(255, 180, 178, 178),
                height: 120,
                child: Center(
                  child: Image.asset(
                    'assets/${selbeg.images[0]}',
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 255, 132, 0),
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    child: Text(
                      selbeg.condition,
                      style: const TextStyle(
                        color: Color.fromARGB(255, 252, 247, 247),
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          // const SizedBox(height: 20),
          Text(
            selbeg.brand,
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 8),
          Text(
            selbeg.model,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              height: 1,
            ),
          ),
          Text(
            (selbeg.condition == "Daily" ? "Өдрийн" : selbeg.condition == "Weekly" ? "Долоо хоногийн" : "Сарын") + " өмнө",
            style: const TextStyle(
              fontSize: 10,
              color: Color.fromARGB(255, 0, 0, 0),
            ),),
        
            Row(
                  mainAxisAlignment: MainAxisAlignment.end, // Aligns children to the end (right)
                  children: [
                    Text(
                      selbeg.une,
                      style: const TextStyle(
                        fontSize: 18,
                        height: 3,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.end,
                    ),
                  ],


          ),
        ],
      ),
    );
  }
}
