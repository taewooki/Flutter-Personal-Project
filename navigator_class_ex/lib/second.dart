import 'package:flutter/material.dart';
class FirstImagePage extends StatelessWidget {
  const FirstImagePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Image Page'),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Image.asset(
              'images/image1.jpg',
              width: 200,
            ),
          ),
          ElevatedButton(
            onPressed: () => {
              Navigator.pop(context),
              Navigator.pop(context)
            },
            child: const Text('Go to Home')
          )
        ],
      )),
    );
  }
}