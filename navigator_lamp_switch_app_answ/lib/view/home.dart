import 'package:flutter/material.dart';

import '../model/message.dart';
import 'update_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main 화면'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context, MaterialPageRoute(
                  builder: (context) {
                    return const UpdatePage();
                  },
                )
              ).then((value) => setState(() {}));
            },
            icon: const Icon(Icons.edit)
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              Message.onoffSwitch ? 
                (Message.colorSwitch? 'images/lamp_on.png' : 'images/lamp_red.png') 
                  : 'images/lamp_off.png',
              width: 150,
            )
          ],
        ),
      ),
    );
  }
}