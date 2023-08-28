import 'package:flutter/material.dart';
import 'package:freshonic/Auth/loginpage.dart';
import 'package:pinput/pinput.dart';

class Myotp extends StatefulWidget {
  const Myotp({Key? key}) : super(key: key);

  @override
  State<Myotp> createState() => _MyotpState();
}

class _MyotpState extends State<Myotp> {
  @override
  Widget build(BuildContext context) {
      double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(onPressed: () {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
            return const Loginpage();
          } ),);
        },
            icon: const Icon(
              Icons.arrow_back_rounded,
              color: Colors.black,
            ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 70,right: 70),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'OTP',
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: screenHeight * 0.05,
              ),
                const Pinput(
                  pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                  showCursor: true,
                ),
              SizedBox(
                height:   screenHeight * 0.05,
              ),
              SizedBox(
                height: 45,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),
                  ),
                  child:  const Text(
                    'Register',
                    style: TextStyle(
                        fontSize: 18
                    ),
                  ),
                ),
              ),
               SizedBox(
                height:   screenHeight * 0.05,
              ),
              SizedBox(
                height: 45,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),
                  ),
                  child:  const Text(
                    'Resend OTP',
                    style: TextStyle(
                        fontSize: 18
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

