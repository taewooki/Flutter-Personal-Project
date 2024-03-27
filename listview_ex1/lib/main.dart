import 'package:flutter/material.dart';
import 'view/detail_page.dart';
import 'view/insert_page.dart';
import 'view/main_page.dart';

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
        '/' : (context) => const MainView(),
        '/insert'  :(context) => const InsertView(),
        '/detail' : (context) => const DetailView(),
      },
    );
  }
}