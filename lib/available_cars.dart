import 'package:bd1/book_car.dart';
import 'package:bd1/car_widget.dart';
import 'package:bd1/data.dart';
import 'package:flutter/material.dart';

class AvailableCars extends StatefulWidget{
  @override 
  _AvailableCarsState createState() => _AvailableCarsState();
}

class _AvailableCarsState extends State <AvailableCars>{
  @override 
  Widget build (BuildContext context){
    return Scaffold (
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding:const  EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(15),
                    ),
                    border: Border.all (
                      color: const Color.fromARGB(255, 224, 224, 224),
                      width: 1,
                    ),
                  ),
                  child: const Icon (
                    Icons.keyboard_arrow_left,
                    color: Colors.black,
                    size: 28,
                  ),
                ),
              ),


              const SizedBox(
                height: 16,
              ),

              const Text(
                "Үнэлгээний зарууд",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

            const   SizedBox(
                height: 15,
              ),

              Expanded(
                child: GridView.count(
                  physics:const  BouncingScrollPhysics(),
                  childAspectRatio: 1/1.3,
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 30,
                  children: getCarList().map((item){
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => BookCar(car: item)),
                        );
                      },
                      child: buildCar(item, 16)
                      );
                  }).toList(),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}