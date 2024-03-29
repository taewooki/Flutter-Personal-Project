import 'package:flutter/material.dart';
import 'package:navigator_class_app/view/third_page.dart';
import 'view/first_page.dart';
import 'view/home.dart';
import 'view/second_page.dart';

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
        '/1st': (context) => const FirstPage(),
        '/2nd': (context) => const SecondPage(),
        '/3rd': (context) => const ThridPage(),
      },
    );
  }
}
