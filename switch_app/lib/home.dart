import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //Property
  late bool switchValue;
  late String titleText;
  late String imagePath;

  @override
  void initState() {
    super.initState();
    switchValue = true;
    titleText = 'Smile';
    imagePath = 'images/smile.png';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titleText),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Image.asset(
                imagePath,
                width: 150,
                fit: BoxFit.fill,
              ),
            ),
            Switch(
              value: switchValue,
              onChanged: (value) {
                switchValue = value;
                titleC(value);
                setState(() {});
              },
            ),
          ],
        ),
      ),
    );
  }
  //-------Functions------

  titleC(bool value) {
    if (value == true) {
      titleText = 'Smile';
      imagePath = 'images/smile.png';
    } else {
      titleText = 'Pikachu';
      imagePath = 'images/pikachu-3.png';
    }
  }
}
