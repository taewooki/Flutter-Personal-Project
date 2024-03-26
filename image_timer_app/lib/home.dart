import 'dart:async';
import 'package:flutter/material.dart';
class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}
class _HomeState extends State<Home> {
  // Property
  late List imageFile;
  late int currentIndex;
  
  @override
  void initState() {
    super.initState();
    imageFile = [
      'flower_01.png',
      'flower_02.png',
      'flower_03.png',
      'flower_04.png',
      'flower_05.png',
      'flower_06.png',
    ];
    currentIndex = 0;
    // Timer
    Timer.periodic(const Duration(seconds: 1), (timer) {
      changeImage();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Timer를 이용한 1초마다 이미지 반복'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${imageFile[currentIndex]}',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
            Image.asset(
              'images/${imageFile[currentIndex]}',
              width: 400,
            ),
          ],
        ),
      ),
    );
  }
  // -- Functions
  changeImage() {
    currentIndex++;
    if(currentIndex > imageFile.length - 1) {
      currentIndex = 0;
    }
    setState(() {});
  }
} // End