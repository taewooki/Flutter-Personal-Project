import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  // Property
late String imageNames;
late bool onoffSwitch;
late double imageWidth;
late double imageHeight;

@override
  void initState() { 
    super.initState();
    onoffSwitch = true;
    imageNames = 'images/lamp_on.png';
    imageWidth = 100;
    imageHeight = 200;

  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main 화면'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {


              
              //
            }, 
            icon: const Icon(Icons.edit),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imageNames,
              width: imageWidth,
              height: imageHeight,
              ),            
          ],
        ),
      ),
    );
  }
}