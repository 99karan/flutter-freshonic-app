

import 'package:flutter/material.dart';
import 'package:freshonic/Auth/loginpage.dart';
import 'package:freshonic/fruits.dart';
import 'package:freshonic/vegetable.dart';

import 'cartpage.dart';

class Mainpage extends StatefulWidget {
  const Mainpage({super.key});

  @override
  State<Mainpage> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {

  int _selectedIndex = 0;

   void _onItemTapped(int index) {
  setState(() {
    _selectedIndex = index;
    // Navigate to the corresponding page based on the selected index
    if (index == 0) {
      // Navigate to the home page
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Mainpage()));
    } else if (index == 1) {
      // Navigate to the cart page
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>  Cartpage()));
    } else if (index == 2) {
      // Navigate to the profile page
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Loginpage()));
    }
  });
}

  List<String> imagesListVeg = [
    'lib/images/Vegetables/broccoli.png',
    'lib/images/Vegetables/cabbage.png',
    'lib/images/Vegetables/chili.png',
    'lib/images/Vegetables/mushroom.png',
    'lib/images/Vegetables/onion.png',
    'lib/images/Vegetables/pumpkin.png',
    'lib/images/Vegetables/spinach.png',
    'lib/images/Vegetables/tomato.png',
    'lib/images/Vegetables/carrot.png',
    'lib/images/Vegetables/cucumber.png',
    'lib/images/Vegetables/avocado.png',
  ];

  List<String> imagesListFruits = [
    'lib/images/Fruits/apple.png',
    'lib/images/Fruits/banana.png',
    'lib/images/Fruits/blueberry.png',
    'lib/images/Fruits/mango.png',
    'lib/images/Fruits/orange.png',
    'lib/images/Fruits/pineapple.png',
    'lib/images/Fruits/strawberry.png',
  ];





  @override
  Widget build(BuildContext context) {


    double screenHeight = MediaQuery.of(context).size.height;
    
    double iwidth = MediaQuery.of(context).size.width;




    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Center(child: Text('Freshonic')),
      ),
      backgroundColor: const Color.fromARGB(255, 254, 228, 125),
      body:  SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             SizedBox(
                width: double.infinity,
                height: screenHeight * 0.07,
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('welcome',style: TextStyle(fontSize: 24),),
                      
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset('lib/images/constraints/profile.png',height: screenHeight * 0.05,),
                    )
                  ],
                  ),
              ),

            
                                  SizedBox(
                                    width: double.infinity,
                                    height: screenHeight * 0.07,
                                    child: Row(
                                      children: [

                                         Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(  
                                            width: iwidth * 0.4,
                                            height: screenHeight * 0.04,
                                            decoration: const BoxDecoration(
                                              color: Color.fromARGB(255, 164, 244, 166),
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(20),
                                                ),
                                              ),
                                            child: const FittedBox(
                                              child: Text('Vegetables',style: TextStyle(fontSize: 24),
                                              ),
                                            ),
                                          ),
                                        ),

                                        const Spacer(),

                                        GestureDetector(
                                          onTap: () => Navigator.pushReplacement(
                                            context,
                                             MaterialPageRoute(
                                              builder: (context) {
                                            return const Vegetables();
                                           },
                                          ),
                                        ),
                                          child: const Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Text('For More',style: TextStyle(fontSize: 24,color: Colors.red),),
                                          ),
                                        ),

                                      ],
                                    ),
                                   ),


              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SizedBox(
                  width: double.infinity,
                  height: screenHeight * 0.2,
                  child: GridView.builder(
                    itemCount: imagesListVeg.length,
                    scrollDirection: Axis.horizontal,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    mainAxisSpacing: 10,
                    ), 
                  itemBuilder: (context , index){
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: const Color.fromARGB(255, 250, 226, 226),
                        image: DecorationImage(
                          image: AssetImage(imagesListVeg[index]),
                          fit: BoxFit.cover 
                          ),
                      ),
                    );
                  }
                  ),
                ),
              ),




                                  SizedBox(
                                    width: double.infinity,
                                    height: screenHeight * 0.07,
                                    child: Row(
                                      children: [
                                        
                                         Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(  
                                            width: iwidth * 0.4,
                                            height: screenHeight * 0.04,
                                            decoration: const BoxDecoration(
                                              color: Color.fromARGB(255, 164, 244, 166),
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(20),
                                                ),
                                              ),
                                            child: const FittedBox(
                                              child: Text('Fruits',style: TextStyle(fontSize: 24),
                                              ),
                                            ),
                                          ),
                                        ),

                                        const Spacer(),

                                        GestureDetector(
                                          onTap: () => Navigator.pushReplacement(
                                            context,
                                             MaterialPageRoute(
                                              builder: (context) {
                                            return const Fruits();
                                           },
                                          ),
                                        ),
                                          child: const Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Text('For More',style: TextStyle(fontSize: 24,color: Colors.red),),
                                          ),
                                        ),

                                      ],
                                    ),
                                   ),


             Padding(
                padding: const EdgeInsets.all(16.0),
                child: SizedBox(
                  width: double.infinity,
                  height: screenHeight * 0.2,
                  child: GridView.builder(
                    itemCount: imagesListFruits.length,
                    scrollDirection: Axis.horizontal,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    mainAxisSpacing: 10,
                    ), 
                  itemBuilder: (context , index){
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: const Color.fromARGB(255, 250, 226, 226),
                        image: DecorationImage(
                          image: AssetImage(imagesListFruits[index]),
                          fit: BoxFit.cover 
                          ),
                      ),
                    );
                  }
                  ),
                ),
              ),


                                


            ],
          ),
        ),
        
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.logout),
            label: 'LogOut',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}