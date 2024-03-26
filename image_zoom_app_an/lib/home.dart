
import 'dart:async';

import 'package:flutter/material.dart';
class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}
class _HomeState extends State<Home> {
  // Property
  late String _lampImage; // Image File Name
  late double _lampWidth; // Image Width
  late double _lampHeight; // Image Height
  late String _buttonName; // Button title
  late bool _switch; // Switch의 On,Off status
  late String _lampSizeStatus; // Lamp 크기의 확대, 축소
  late double _rotation; // 회전 각도
  @override
  void initState() {
    super.initState();
    _lampImage = 'images/lamp_on.png';
    _lampWidth = 150;
    _lampHeight = 300;
    _buttonName = "Image 확대";
    _switch = true;
    _lampSizeStatus = 'small';
    _rotation = 0;
    Timer.periodic(const Duration(milliseconds: 10), (timer) {
    _rotation = _rotation + 1;
      if(_lampWidth <= 300) {
        _lampWidth += 1;
        _lampHeight += 1;
      }
      if(_rotation == 180) {
        _switch = false;
        decisionOnOff();
      }
      if(_rotation >= 360) {
        _switch = true;
        decisionOnOff();
        _rotation = 0;
      }
      setState(() {});
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image 확대 및 축소'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 330,
              height: 630,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RotationTransition(
                    turns: AlwaysStoppedAnimation(_rotation/360),
                    child: Image.asset(
                      _lampImage,
                      width: _lampWidth,
                      height: _lampHeight,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () => decisionLampSize(),
                  child: Text(_buttonName),
                ),
                Column(
                  children: [
                    const Text('전구 스위치'),
                    Switch(
                      value: _switch,
                      onChanged: (value) {
                        _switch = value;
                        decisionOnOff();
                      },
                    )
                  ],
                )
              ],
            ),
            Container(
              color: Colors.amber,
              width: 300,
              child: Slider(
                value: _rotation,
                onChanged: (value) {
                  _rotation = value;
                  setState(() {});
                },
                min: 0,
                max: 360,
              ),
            )
          ],
        ),
      ),
    );
  }
  // -- Functions
  decisionLampSize() {
    if(_lampSizeStatus == 'small') {
      _lampWidth = 300;
      _lampHeight = 600;
      _buttonName = 'Image 축소';
      _lampSizeStatus = 'large';
    }
    else {
      _lampWidth = 150;
      _lampHeight = 300;
      _buttonName = 'Image 확대';
      _lampSizeStatus = 'small';
    }
    setState(() {});
  }
  decisionOnOff() {
    if(_switch) {
      _lampImage = 'images/lamp_on.png';
    }
    else {
      _lampImage = 'images/lamp_off.png';
    }
    setState(() {});
  }
} // End