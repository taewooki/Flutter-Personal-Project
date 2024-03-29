import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text with Colum and Row'),
        backgroundColor: Colors.cyan,
        foregroundColor: Colors.white,
      ),
      backgroundColor: Colors.indigo,
      body: Center(
        child: Container(
          color: Colors.yellow,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("유비"),
              Text("관우"),
              SizedBox(
                height: 50,
              ),
              Text("장비"),
              Text("제갈량"),
            ],
          ),
        ),
      ),
    );
  }
}
