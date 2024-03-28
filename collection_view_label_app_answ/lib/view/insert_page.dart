import 'package:flutter/material.dart';

import '../model/message.dart';

class InsertPage extends StatefulWidget {
  const InsertPage({super.key});

  @override
  State<InsertPage> createState() => _InsertPageState();
}

class _InsertPageState extends State<InsertPage> {
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('인물 추가'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                label: Text('인물을 추가 하세요.'),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if(controller.text.trim().isNotEmpty) {
                  addList();
                  Navigator.pop(context);
                }
              },
              child: const Text('OK')
            )
          ],
        ),
      ),
    );
  }
  // -- Functions
  addList() {
    Message.heroName = controller.text.trim();
    Message.status = true;
  }
}