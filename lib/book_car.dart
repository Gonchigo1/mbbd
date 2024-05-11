import 'package:bd1/data.dart';
import 'package:flutter/material.dart';


class BookCar extends StatefulWidget{

  final Car car;

  BookCar({required this.car}); 
  
  @override 
  _BookCarState createState() => _BookCarState();
}

class _BookCarState extends State <BookCar>{

  int _currentImage = 0;

  List <Widget> buildPageIndicator(){
    List <Widget> list = [];
    for (var i=0; i<widget.car.images.length; i++){
      list.add(buildIndicator(i == _currentImage));
    }
    return list;
  }

  Widget buildIndicator (bool isActive){
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 6),
      height: 8,
      width: isActive ? 20 : 8,
      decoration: BoxDecoration( 
        color: isActive ? Colors.black : Colors.grey[400],
        borderRadius: const BorderRadius.all( 
          Radius.circular(12),
        ),
      ),
    );
  }


  @override 
  Widget build (BuildContext context){
    return Scaffold (
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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

                            Row(
                              children: [

                                Container(
                                width: 45,
                                height: 45,
                                decoration: const BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(15),
                                  ),
                                ),
                                child: const Icon (
                                  Icons.bookmark_border,
                                  color: Colors.white,
                                  size: 22,
                                ),
                              ),

                              ],
                            ),

                          ],
                        ),
                        ),

                        const SizedBox(
                          height: 16,
                        ),
                        
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            widget.car.model,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          ),


                        const SizedBox(
                          height: 8,
                        ),
                        
                        Padding(
                          padding:const EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            widget.car.brand,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                          ),



                        // Zurag
                        const SizedBox(
                          height: 5,
                        ),

                          Expanded(
  child: Container(
    child: PageView(
      physics: const BouncingScrollPhysics(),
      onPageChanged: (int page) {
        setState(() {
          _currentImage = page;
        });
      },
      children: widget.car.images.map((path) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Image.asset(
            path,
            fit: BoxFit.cover,
          ),
        );
      }).toList(),
    ),
  ),
),


                      widget.car.images.length > 1 
                      ? Container (
                        margin: const EdgeInsets.symmetric(vertical: 16,),
                        height: 30,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: buildPageIndicator(),
                        ),
                      )
                      : Container (),
                      ],
                    ),
                  )),

              // Mashinii medeelel
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: const BorderRadius.only( 
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                 ),
                 child: Column ( 
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    const Padding(
                      padding: const EdgeInsets.only(top: 16, left: 16, right: 16 ),
                      child: Text(
                        "Машины мэдээлэл",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                    ),

                    Container(
                      height: 100,
                      padding:const  EdgeInsets.only(top: 5, left: 10,),
                      margin: const EdgeInsets.only(bottom: 19),
                      child: ListView(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        children: [
                          buildSpecificationCar("Үйлдвэрлэгч", "BMW"),
                          buildSpecificationCar("Нэр", "M package"),
                          buildSpecificationCar("Төрөл", "Суудлын"),
                          buildSpecificationCar("Өнгө", "Цагаан"),
                          buildSpecificationCar("Үйлдвэрлэсэн он", "2017"),
                        ],
                      ),
                    ),

                  ],
                 ),
              ),
            ],
          ),
          ),
        ),
        
        //Uniin medeelel
        bottomNavigationBar: Container(
        height: 90,
        padding:const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "2 хоногийн өмнө",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),

                SizedBox(
                  height: 4,
                ),

                Row(
                  children: [

                    Text(
                      "4.500.000₮",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),

                  ],
                ),

              ],
            ),
            Container(
              height: 50,
              decoration: const BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              child: const Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    "Үнэлэгдсэн",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

    );
  }

  // Mashinii medeelliin punkts
  Widget buildSpecificationCar(String title, String data){
    return Container(
      width: 150,
      decoration:const  BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16,),
      margin: const EdgeInsets.only(right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Text(
            title,
            style:const  TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
          ),

         const SizedBox(
            height: 8,
          ),

          Text(
            data,
            style:const TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

        ],
      ),
    );
  }
}