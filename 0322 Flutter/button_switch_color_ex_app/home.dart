import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late bool switchState;
  late Color buttonColor;

  @override
  void initState() {
    super.initState();
    switchState = false;
    buttonColor = Colors.blue;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Changed Button color on Switch'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => clickAction(),
              style: ElevatedButton.styleFrom(
                backgroundColor: buttonColor,
                foregroundColor: Colors.white 
              ),
              child: const Text('FLutter'),
            ),
            Switch(
              value: switchState,
              onChanged: (value) => clickAction(),
            )
          ],
        ),
      ),
    );
  }

  clickAction() {
    if(switchState) {
      switchState = false;
      buttonColor = Colors.blue;
    }
    else {
      switchState = true;
      buttonColor = Colors.red;
    }
    setState(() {});
  }
}