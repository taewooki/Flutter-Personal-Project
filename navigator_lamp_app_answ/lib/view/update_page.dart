import 'package:flutter/material.dart';

import '../model/message.dart';

class UpdatePage extends StatefulWidget {

  const UpdatePage(
    {
      super.key,
    }
  );

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  // Property
  late bool switchStatus;

  @override
  void initState() {
    super.initState();
    switchStatus = Message.onoffSwitch;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('수정화면'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              // Main 화면의 공지 Text
              controller: Message.controller,
            ),
            Row(
              children: [
              Text(
                switchStatus ? 'On' : 'Off'
              ), 
                Switch(
                  value: switchStatus,
                  onChanged: (value) {
                    switchStatus = value;
                    setState(() {});
                  },
                )
              ],
            ),
            ElevatedButton(
              onPressed: () {
                Message.onoffSwitch = switchStatus;
                Navigator.pop(context);
              },
              child: const Text('OK')
            )
          ],
        ),
      ),
    );
  }

} // End