// import 'dart:js_interop';

import 'package:bd1/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Widget buildCar(Car car, int index){
  return Container(
    decoration: const BoxDecoration(
      color: Color.fromARGB(255, 147, 32, 32),
      borderRadius: BorderRadius.all(Radius.circular(15),
      ),
    ),
    padding: const EdgeInsets.all(16),
    margin: EdgeInsets.only(right: 16, left: index == 0 ? 16 : 0),
    // width: 220,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
      
      Stack(
        children: [
        
          Container(
            color: Color.fromARGB(255, 117, 116, 114),
            height:90,
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
              color: Color.fromARGB(255, 130, 118, 118),
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Text(
                car.condition,
                style:const  TextStyle(
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

     const  SizedBox(
        height: 20 
        ),

      Text(
        car.brand,
        style: TextStyle(fontSize: 18)
      ),


     const SizedBox(
        height: 8 ,
        ),

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