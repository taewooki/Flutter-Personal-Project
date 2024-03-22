import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          title: Column(
            children: [
              Text('Navigator AppBar'),
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
                icon: const Icon(Icons.email_outlined)),
          ]),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/send'),
              icon: const Icon(Icons.email),
              child: null,
            ),
            Text('보낸편지함'),
            SizedBox(
              height: 50,
            ),
            Text('받은편지함'),
          ],
        ),
      ),
    );
  }
}
