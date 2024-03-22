import 'package:flutter/material.dart';
import 'package:navigator_appbar_ex_app/view/home.dart';
import 'package:navigator_appbar_ex_app/view/received.dart';
import 'package:navigator_appbar_ex_app/view/send.dart';

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
        '/' :(context) => const Home(),
        '/send' :(context) => const SendMail(),
        '/received' :(context) => const ReceivedMail()
      },
    );
  }
}