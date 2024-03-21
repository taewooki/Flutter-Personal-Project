import 'package:flutter/material.dart';

import 'view/First_Screen.dart';
import 'view/Home.dart';
import 'view/Second_Screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(       
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
        '/1st' :(context) => const FirstScreen(),
        '/2nd' :(context) => const SecondScreen(),
      }
    );
  }
}



