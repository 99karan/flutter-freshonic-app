

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:freshonic/Auth/forgotpassword.dart';
import 'package:freshonic/mainpage.dart';
import 'package:freshonic/Auth/signuppage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {


final TextEditingController _emailController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();

 void _handleGoogleSignIn() async {
    await signInWithGoogle(context);
  }


  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double iwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
               Container(
                    height: screenHeight * 0.3,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          'lib/images/constraints/background.jpg',
                      ),
                      fit: BoxFit.fill
                    ),
                    ),
                  ),
                   SizedBox(
                    height: screenHeight * 0.025,
                  ),


                  //Email
                  
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: TextField(
                                     controller: _emailController,
                                     decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                      hintText: 'Email',
                      hintStyle: TextStyle(color: Colors.grey[700]),
                                     ),
                                   ),
                   ),
                SizedBox(
                    height: screenHeight * 0.025,
                  ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                      hintText: 'Password',
                      hintStyle: TextStyle(color: Colors.grey[700]),
                    ),
                  ),
                ),
                
                          SizedBox(
                                  height: screenHeight * 0.003,
                                ),
                         GestureDetector(
                             onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(
                               builder: (context) {
                                 return const Forgotpage();
                               }),),
                               child: Center(
                                 child: Text(
                                   'Forgot Password?',
                                   style: TextStyle(
                                     color: Colors.black,
                                     fontSize: screenHeight * 0.025,
                                     ),
                                   ),
                               ),
                              ),
                              
                          SizedBox(
                                  height: screenHeight * 0.02,
                                ),



                          GestureDetector(
                                  onTap: () async {
                                    String email = _emailController.text.trim();
                                    String password = _passwordController.text.trim();
                                  },
                                  child: Container(
                                    width: iwidth * 0.5,
                                    decoration: BoxDecoration(
                                      color: Colors.purple,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    padding: const EdgeInsets.all(10),
                                    child: Center(
                                      child: Text(
                                        'Login',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: screenHeight * 0.025,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),

                              SizedBox(
                                  height: screenHeight * 0.02,
                                ),
                               SizedBox(
                                height: screenHeight * 0.035,
                                child: const FittedBox(
                                  child: Center(
                                    child: Text(
                                            'or',
                                              style: TextStyle(
                                              color: Colors.black,
                                           ),
                                          ),
                                  ),
                                ),
                                ),


                              //Google Sign-In

                                GestureDetector(
                                    onTap: _handleGoogleSignIn,
                                    child: Container(
                                      width: iwidth * 0.7,
                                      decoration: BoxDecoration(
                                        color: const Color.fromARGB(255, 255, 42, 0),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      padding: const EdgeInsets.all(10),
                                      child: Center(
                                        child: Text(
                                          'Continue with Google',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: screenHeight * 0.025,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),



                              SizedBox(
                                  height: screenHeight * 0.02,
                                ),



                               SizedBox(
                                height: screenHeight * 0.035,
                                child: const FittedBox(
                                  child: Center(
                                    child: Text(
                                            'or',
                                              style: TextStyle(
                                              color: Colors.black,
                                           ),
                                          ),
                                  ),
                                ),
                                ),
                                SizedBox(
                                  height: screenHeight * 0.02,
                                ),
                         GestureDetector(
                             onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(
                               builder: (context) {
                                 return const Signuppage();
                               }),),
                               child: Container(
                                 width: iwidth  * 0.7,
                                 decoration: BoxDecoration(
                                   color: Colors.blue,
                                   borderRadius: BorderRadius.circular(10),
                                 ),
                                 padding: const EdgeInsets.all(10),
                                 child: Center(
                                   child: Text(
                                     'SignUp',
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
                  

          );
  }
}

 void _signInWithGoogle(BuildContext context) async {
  await signInWithGoogle(context);
}

Future<void> signInWithGoogle(BuildContext context) async {

   GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      GoogleSignInAuthentication? googleAuth= await googleUser?.authentication;


        AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken ,
          idToken: googleAuth?.idToken
        );
      UserCredential userCredential= await  FirebaseAuth.instance.signInWithCredential(credential);
      print(userCredential.user?.displayName);

      if(userCredential.user != null){
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const Mainpage()));
      }

}

    