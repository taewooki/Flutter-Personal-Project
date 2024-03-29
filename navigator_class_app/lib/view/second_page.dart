import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SecondPage'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Text('Test'),
      ),
    );
  }
}
