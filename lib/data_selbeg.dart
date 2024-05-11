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

class Selbeg {

  String brand; // uildwerlegch 
  String model; // ner
  String type; //Turul
  int date; // uildwerlesen on
  String color; // ongo 
  String condition;
  List<String> images;
  String une;

  Selbeg(
    this.brand, 
    this.model, 
    this.type,
    this.date, 
    this.color,
    this.condition, 
    this.images,
    this.une
    );

}

List<Selbeg> getSelbegList(){
  return <Selbeg>[
    Selbeg(
      "Toyota engine",
      "Camry",
      "Суудлын машин",
      2012,
      "",
      "Баталгаажсан",
      [        
        "images/camryengine.png",

      ],
      "2'500'000₮",
    ),
    Selbeg(
      "Nissan",
      "Nissan",
      "Суудлын машин",
      2020,
      "",
      "Баталгаажсан",
      [
        "images/selbeg1.png",

      ],
      "300'000₮",
    ),
    Selbeg(
      "Toyota",
      "Absorber",
      "",
      2023,
      "",
      "Баталгаажсан",
      [
        "images/amortizator1.png",
      ],
      "100'000₮",
    ),
    Selbeg(
      "Ford",
      "Absorber",
      "",
      2015,
      "",
      "Баталгаажсан",
      [
        "images/amortizator.png",
      ],
      "1'000'000₮",
    ),
    Selbeg(
      "Mercedes",
      "Cls-250",
      "Суудлын машин",
      2019,
      "Black",
      "Баталгаажсан",
      [
        "images/door.png",
      ],
      "500'000₮",
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