import 'package:flutter/material.dart';
import 'package:freshonic/Auth/loginpage.dart';
import 'package:firebase_auth/firebase_auth.dart';

bool _passwordsMatch = false;

class Signuppage extends StatefulWidget {
  const Signuppage({super.key});

  @override
  State<Signuppage> createState() => _SignuppageState();
}

class _SignuppageState extends State<Signuppage> {

final TextEditingController _emailController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();


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
                    height: screenHeight * 0.025,
                  ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    obscureText: true,
                     onChanged: (confirmPassword) {
                    setState(() {
                    _passwordsMatch = confirmPassword == _passwordController.text;
                      });
                     },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                      hintText: 'Confirm Password',
                      hintStyle: TextStyle(color: Colors.grey[700]),
                    ),
                  ),
                ),
                SizedBox(
                    height: screenHeight * 0.025,
                  ),
                 GestureDetector(
                  onTap: () async {
                   if (_passwordsMatch) {
                        String email = _emailController.text.trim();
                        String password = _passwordController.text.trim();
                  
                        try {
                          final userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                            email: email,
                            password: password,
                          );
                          print("Created New Account");
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const Loginpage()));
                        } on FirebaseAuthException catch (e) {
                          print("Error during sign-up: $e");
                        }
                      } else {
                        print("Passwords do not match");
                      }
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
                );
}
}

