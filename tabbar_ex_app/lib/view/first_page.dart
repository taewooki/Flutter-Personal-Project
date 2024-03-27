import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 194, 189),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(10.0),
              child: CircleAvatar(
                backgroundImage: AssetImage(
                  'images/flower_01.png',
                ),
                radius: 70,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: CircleAvatar(
                backgroundImage: AssetImage(
                  'images/flower_02.png',
                ),
                radius: 70,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: CircleAvatar(
                backgroundImage: AssetImage(
                  'images/flower_03.png',
                ),
                radius: 70,
              ),
            )
          ],
        ),
      ),
    );
  }
}