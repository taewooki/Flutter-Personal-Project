import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Text('App Bar Icon'),
          ],
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            //
          },
          icon: const Icon(Icons.menu),
        ),
        actions: [
          IconButton(
              onPressed: () {
                //
              },
              icon: const Icon(Icons.email)),
          IconButton(
              onPressed: () {
                //
              },
              icon: const Icon(Icons.add_alarm)),
          IconButton(
              onPressed: () {
                //
              },
              icon: const Icon(Icons.add_outlined)),
          GestureDetector(
            onTap: () {
              print("smail image is tapped.");
            },
            child: Image.asset(
              'images/smile.png',
              width: 30,
            ),
          ),
        ],
      ),
    );
  }
}
