import 'package:flutter/material.dart';

import '../model/message.dart';

class UpdatePage extends StatefulWidget {
  const UpdatePage({super.key});

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  late bool colorSwitch;
  late bool onoffSwitch;

  @override
  void initState() {
    super.initState();
    colorSwitch = Message.colorSwitch;
    onoffSwitch = Message.onoffSwitch;
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 30,
                  child: Text(
                    colorSwitch ? '' : 'Red'
                  )
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Switch(
                    value: colorSwitch,
                    onChanged: (value) => setState(() {colorSwitch = value;})
                  ),
                ),
                SizedBox(
                  width: 50,
                  child: Text(
                    colorSwitch ? 'Yellow' : ''
                  )
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 30,
                  child: Text(
                    onoffSwitch ? '' : 'Off'
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Switch(
                    value: onoffSwitch,
                    onChanged: (value) => setState(() {onoffSwitch = value;})
                  ),
                ),
                SizedBox(
                  width: 50,
                  child: Text(
                    onoffSwitch ? 'On' : ''
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: 30,),
                  ElevatedButton(
                    onPressed: () {
                      Message.colorSwitch = colorSwitch;
                      Message.onoffSwitch = onoffSwitch;
                      Navigator.pop(context);
                    },
                    child: const Text('OK')
                  ),
                  SizedBox(width: 50,)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}