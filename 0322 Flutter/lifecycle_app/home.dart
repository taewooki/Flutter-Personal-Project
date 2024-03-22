import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Field
  late String buttonState;

  @override
  void initState() {
    super.initState();
    buttonState = "OFF";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Life Cycle'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () => onClick(), child: const Text('버튼을 누르세요!')),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [const Text('버튼상태 : '), Text(buttonState)],
            )
          ],
        ),
      ),
    );
  }

  // Functions
  onClick() {
    buttonState = (buttonState == 'OFF' ? 'ON' : 'OFF');
    setState(() {});
  }
}
