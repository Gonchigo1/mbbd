// import 'dart:js_interop';

import 'package:bd1/data_selbeg.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Widget buildCar1(Selbeg selbeg, int index){
  return Container(
    decoration: const BoxDecoration(
      color: Color.fromARGB(255, 255, 255, 255),
      borderRadius: BorderRadius.all(Radius.circular(15),
      ),
    ),
    padding: const EdgeInsets.all(16),
    margin: EdgeInsets.only(right: 16, left: index == 0 ? 16 : 0),
    // width: 220,
    // height: 300,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
      
      Stack(
        children: [
        
          Container(
            color: Color.fromARGB(255, 255, 254, 252),
            height:90,
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
              color: Color.fromARGB(255, 255, 81, 0),
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Text(
                selbeg.condition,
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
        // height: 50 
        ),

      Text(
        selbeg.brand,
        style: TextStyle(fontSize: 18)
      ),


     const SizedBox(
        // height: 8 ,
        ),

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
        ),
      ),
    
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