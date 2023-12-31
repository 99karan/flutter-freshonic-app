import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'intropage.dart';
import 'List/listveg.dart';
import 'List/listfruits.dart';

import 'package:firebase_core/firebase_core.dart';




void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ListVeg()), // Provide ListVeg
        ChangeNotifierProvider(create: (context) => ListFruits()), 
      ],
    child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
    title: 'Flutter Demo',
    home: Intropage(),
    );
  }
}
