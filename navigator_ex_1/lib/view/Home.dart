import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/1st'),
              child: const Text('Go to the screen 1st'),
            ),
            ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/2nd'),
                child: const Text('Go to the screen 2nd')),
          ],
        ),
      ),
    );
  }
}
