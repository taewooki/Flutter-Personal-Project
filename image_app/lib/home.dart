import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      appBar: AppBar(
        title: const Text('Image Test'),
        backgroundColor: Colors.amberAccent,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis, Vertical,
        child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/smile.png',
              width: 150,
              ),            
              Image.asset(
              'images/smile.png',
              width: 50,
              height: 100,
              fit: BoxFit.fill,
              ),            
              Image.asset(
              'images/smile.png',
              width: 150,
              fit: BoxFit.contain,
              ),            
              Image.asset(
              'images/smile.png',
              width: 50,
              fit: BoxFit.cover,
              ),            
              Image.asset(
              'images/smile.png',
              width: 150,
              ),            
              Image.asset(
              'images/smile.png',
              width: 150,
              ),            
              Image.asset(
              'images/smile.png',
              width: 150,
              ),            
              Image.asset(
              'images/smile.png',
              width: 150,
              ),            
              Image.asset(
              'images/smile.png',
              width: 150,
              ),            
              Image.asset(
              'images/smile.png',
              width: 150,
              ),

          ],
        ),
      ),
      ),
    );
  }
}