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
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main 화면'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        leading: const Icon(
          Icons.home
        ),
        actions:  [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return const UpdatePage();
                }
              )).then((value) => setState(() {}));
            },
            icon: const Icon(Icons.edit)
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextField(
              controller: Message.controller,
              decoration: const InputDecoration(
                label: Text('글자를 입력하세요')
              ),
            ),
            Image.asset(
              Message.onoffSwitch ? 'images/lamp_on.png' : 'images/lamp_off.png',
              width: 200,
            ),
          ],
        ),
      ),
    );
  }

} // End