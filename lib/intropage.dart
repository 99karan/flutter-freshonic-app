
import 'package:flutter/material.dart';
import 'package:freshonic/Auth/loginpage.dart';



class Intropage extends StatelessWidget {
  const Intropage({super.key});



  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return  Scaffold(
      backgroundColor: const Color.fromARGB(255, 215, 255, 168),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: screenHeight * 0.1,
              ),
              SizedBox(
                height: screenHeight * 0.3,
                child: Image.asset('lib/images/constraints/shoppingbag.png'),
              ),
              SizedBox(
                height: screenHeight * 0.07,
              ),
              SizedBox(
                height: screenHeight * 0.1,
                child: Center(child: FittedBox(child: Text('Freshonic',style: TextStyle(fontSize: screenHeight * 0.05 ),),),),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: screenHeight * 0.1,
                  child: Center(child: FittedBox(child: Text('Get Fresh Fruits & Vegetables EveryDay',style: TextStyle(fontSize: screenHeight * 0.05 ),),),),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.07,
              ),
             GestureDetector(
              onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(
                builder: (context) {
                  return const Loginpage();
                }),),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    'Get Started',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: screenHeight * 0.025,
                      ),
                    ),
                ),
             )
            ],
          ),
        ),
      ),
    );
  }
}