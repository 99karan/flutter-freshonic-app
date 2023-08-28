import 'package:flutter/material.dart';
import 'package:freshonic/Auth/loginpage.dart';

import 'List/listfruits.dart';
import 'grocery_tile.dart';
import 'package:freshonic/cartpage.dart';
import 'package:provider/provider.dart';

import 'mainpage.dart';

class Fruits extends StatefulWidget {
  const Fruits({super.key});

  @override
  State<Fruits> createState() => _FruitsState();
}

class _FruitsState extends State<Fruits> {
 
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
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Cartpage()));
    } else if (index == 2) {
      // Navigate to the profile page
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Loginpage()));
    }
  });
}


   @override
  Widget build(BuildContext context) {
    double iwidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Center(child: Text('Freshonic')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const Cartpage();
            }, 
          ),
        ),
        backgroundColor: Colors.black,
        child: const Icon(Icons.shopping_bag),
      ),
      backgroundColor: const Color.fromARGB(255, 254, 228, 125),
      body:  SafeArea(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxHeight: screenHeight),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
          
                                    SizedBox(
                                      width: double.infinity,
                                      height: screenHeight * 0.07,
                                      child: Padding(
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
                                     ),
          
          
                Expanded(
                  child: Consumer<ListFruits>(
                    builder: (context, value, child) {
                      return GridView.builder(
                        itemCount: value.shopItems.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1 / 1.3,
                        ),
                        itemBuilder: (context, index) {
                          return GroceryItemTile(
                            itemName: value.shopItems[index][0],
                            itemPrice: value.shopItems[index][1],
                            imagePath: value.shopItems[index][2],
                            color: value.shopItems[index][3],
                            onPressed: () {
                              Provider.of<ListFruits>(
                                context,
                                listen: false,
                              ).addItemToCart(index);
                            },
                          );
                        },
                      );
                    }
                  ),
                ), 
          
          
                SizedBox(
                  height: screenHeight * 0.3,
                ),
          
          
                                  
          
          
              ],
            ),
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