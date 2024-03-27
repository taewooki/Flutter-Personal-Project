import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text review'),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('text'),
            SizedBox(
              height: 10,
            ),
            Text('Text'),
            SizedBox(
              height: 10,
            ),
            Text('test'),
          ],
        ),
      ),
    );
  }
}
