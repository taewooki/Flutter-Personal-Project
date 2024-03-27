import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('삼국지'),
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
        foregroundColor: Colors.white,
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("유비"),
            Text("장비"),
            SizedBox(
              height: 50,
            ),
            Text("관우"),
            Text("제갈량"),
          ],
        ),
      ),
    );
  }
}
