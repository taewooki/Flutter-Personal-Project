import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
  late String _buttonName; // Button tile
  late bool _switch; // 켜짐 상태
  late String _lampSizeStatus; // 현재 화면의 Lamp 크기
  late double _rotation; // 회전 각도

  @override
  void initState() {
    super.initState();
    _lampImage = 'images/lamp_on.png';
    _lampWidth = 150;
    _lampHeight = 100;
    _buttonName = "Image  확대";
    _switch =  true;
    _lampSizeStatus = "small";
    _rotation = 0;

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image 확대 및 축소'),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              width: 330,
              height: 630,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
              RotationTransition(
                turns: const AlwaysStoppedAnimation(90/360),
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
                    onPressed: ()=> decisionLampSize(),                    
                    child: Text(_buttonName),
                  ),
                  Column(
                    children: [
                      const Text(
                        '전구 스위치',
                        style: TextStyle(
                          fontSize: 10
                        ),
                      ),
                      Switch(
                        value: _switch, 
                        onChanged: (value) {
                          _switch = value;
                          decisionOnOff();
                        },
                      ),
                    ],
                  ),
                ],
              ),
              Slider(
                value: _rotation,
                min: 0,
                max: 360, 
                onChanged: (value) {
                  _rotation = value;
                  setState(() {});
                },
              ),
          ],
        ),
      ),
    );
  }

  //-----Funcitons-----

  decisionLampSize(){
    if(_lampSizeStatus == 'small'){
      _lampWidth = 250;
      _lampHeight = 500;
      _buttonName ='Image 축소';
      _lampSizeStatus = 'large';

    }else{     
      _lampWidth = 150;
      _lampHeight = 300;
      _buttonName ='Image 확대';
      _lampSizeStatus = 'small 축소';

    }
    setState(() {});
    
  }
  
}