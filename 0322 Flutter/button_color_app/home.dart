import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  late String buttonText;
  late bool state;
  late Color buttonColor;

  @override
  void initState() {
    super.initState();
    state = false;
    buttonText = 'Hello';
    buttonColor = Colors.blue;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change button color & text'),
        backgroundColor: buttonColor,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => changButtonState(),
          style: ElevatedButton.styleFrom(
            backgroundColor: buttonColor,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
            ),
            minimumSize: const Size(100, 50),
          ),
          child: Text(buttonText),
        ),
      ),
    );
  }

  // Function
  changButtonState() {
    if(state) {
      state = false;
      buttonText = 'Hello';
      buttonColor = Colors.blue;
    }
    else {
      state = true;
      buttonText = 'Flutter';
      buttonColor = Colors.amber;
    }
    setState(() {});
  }
}