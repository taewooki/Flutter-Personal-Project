import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Scareen'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '1st'),                
                child: const Text('Go to the screen #1'),                              
                ), 

            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '2nd'),
              child: const Text('Go to the screen #2',)),
          ],
        ),
      ),
    );
  }
}
