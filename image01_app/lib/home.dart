import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[200],
      appBar : AppBar(
        title: const Text('Image 01'),

      ),

      
    body: Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: AssetImage(
                'images/pikachu-1.png'
              ),
              radius: 70,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: AssetImage(
                'images/pikachu-2.png'
              ),
              radius: 70,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: AssetImage(
                'images/pikachu-3.png'
              ),
              radius: 70,
            ),
          ),
        ],
      ),
      
    ),

    );
  }
}