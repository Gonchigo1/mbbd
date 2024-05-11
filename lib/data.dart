import 'package:flutter/material.dart';

class NavigationItem {

  IconData iconData;

  NavigationItem(this.iconData);
}

List<NavigationItem> getNavigationItemList(){
  return <NavigationItem>[
    NavigationItem(Icons.home),
    NavigationItem(Icons.calendar_today),
    NavigationItem(Icons.notifications),
    NavigationItem(Icons.person),
  ];
}

class Car {

  String brand; // uildwerlegch 
  String model; // ner
  String type; //Turul
  int date; // uildwerlesen on
  String color; // ongo 
  String condition;
  List<String> images;

  Car(
    this.brand, 
    this.model, 
    this.type,
    this.date, 
    this.color,
    this.condition, 
    this.images
    
    );

}

List<Car> getCarList(){
  return <Car>[
    Car(
      "BMW",
      "M package",
      "Суудлын машин",
      2017,
      "Саарал",
      "Үнэлэгдсэн",
      [        
        "images/Mpackage1.jpg",
        "images/Mpackage2.jpg",
      ],
    ),
    Car(
      "Nissan",
      "NV200",
      "Суудлын машин",
      2012,
      "Цагаан",
      "Үнэлэгдсэн",
      [
        "images/NV200_1.jpg",
        "images/NV200_2.jpg",
        "images/NV200_3.jpg",
      ],
    ),
    Car(
      "Toyota",
      "Crown Xle",
      "Суудлын машин",
      2023,
      "Хар",
      "Үнэлэгдсэн",
      [
        "images/Xle_1.png",
        "images/Xle_2.jpg",
        "images/Xle_3.jpg",
        "images/Xle_4.jpg",
      ],
    ),
    Car(
      "Ford",
      "Edge SE",
      "Суудлын машин",
      2022,
      "Цагаан",
      "Үнэлэгдсэн",
      [
        "images/SE_1.jpg",
        "images/SE_2.jpg",
        "images/SE_3.jpg",
      ],
    ),
    Car(
      "Hyundai",
      "Santa Fe",
      "Суудлын машин",
      2012,
      "Хар",
      "Үнэлэгдсэн",
      [
        "images/santa4.jpg",
        "images/Sante1.jpg",
        "images/santa2.jpg",
        "images/santa3.jpg",
      ],
    ),
  ];
}

class Dealer {

  String name;
  int offers;
  String image;


  Dealer(this.name, this.offers, this.image);

}

List<Dealer> getDealerList(){
  return <Dealer>[
    Dealer(
      "Hertz",
      174,
      "assets/images/hertz.png",
    ),
    Dealer(
      "Avis",
      126,
      "assets/images/avis.png",
    ),
    Dealer(
      "Tesla",
      89,
      "assets/images/tesla.jpg",
    ),
  ];
}

class Filter {

  String name;

  Filter(this.name);

}

List<Filter> getFilterList(){
  return <Filter>[
    Filter("Best Match"),
    Filter("Highest Price"),
    Filter("Lowest Price"),
  ];
}