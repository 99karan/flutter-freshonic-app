import 'package:flutter/material.dart';
import 'package:freshonic/Auth/otp.dart';


class Forgotpage extends StatefulWidget {
  const Forgotpage({super.key});

  @override
  State<Forgotpage> createState() => _ForgotpageState();
}

class _ForgotpageState extends State<Forgotpage> {
  @override
  Widget build(BuildContext context) {
  double screenHeight = MediaQuery.of(context).size.height;
    double iwidth = MediaQuery.of(context).size.width;

    return  Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                    height: screenHeight * 0.025,
                  ),
               Container(
                    height: screenHeight * 0.3,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          'lib/images/constraints/forgot.png',
                      ),
                      fit: BoxFit.contain
                    ),
                    ),
                  ),
                   SizedBox(
                    height: screenHeight * 0.025,
                  ),
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: SizedBox(
                      height: screenHeight * 0.5,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: SizedBox(
                              height: screenHeight * 0.1,
                              child: TextField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                                  hintText: 'Emial',
                                  hintStyle: TextStyle(color: Colors.grey[700])
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: SizedBox(
                              height: screenHeight * 0.1,
                              child: TextField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                                  hintText: 'Password',
                                  hintStyle: TextStyle(color: Colors.grey[700])
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: SizedBox(
                              height: screenHeight * 0.1,
                              child: TextField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                                  hintText: 'Password',
                                  hintStyle: TextStyle(color: Colors.grey[700])
                                ),
                              ),
                            ),
                          ),


                               SizedBox(
                                  height: screenHeight * 0.025,
                                ),


                          GestureDetector(
                             onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(
                               builder: (context) {
                                 return const Myotp();
                               }),),
                               child: Container(
                                 width: iwidth  * 0.5,
                                 decoration: BoxDecoration(
                                   color: Colors.green,
                                   borderRadius: BorderRadius.circular(10),
                                 ),
                                 padding: const EdgeInsets.all(10),
                                 child: Center(
                                   child: Text(
                                     'Register',
                                     style: TextStyle(
                                       color: Colors.white,
                                       fontSize: screenHeight * 0.025,
                                       ),
                                     ),
                                 ),
                                ),
                              ),

                            ],
                          ),
                        ),
                   ),
            ],
          ),
        ),
      ),
    );
  }
}