import 'package:flutter/material.dart';
class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}
class _HomeState extends State<Home> {
  // Property
  late String imageNames;
  late bool zoomSwitch;
  late bool onoffSwitch;
  late bool colorSwitch;
  late double imageWidth;
  late double imageHeight;
  @override
  void initState() {
    super.initState();
    zoomSwitch = true;
    onoffSwitch = true;
    imageNames = 'images/lamp_on.png';
    imageWidth = 100;
    imageHeight = 200;
    colorSwitch = false;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image 확대 및 축소'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 250,
              height: 450,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    imageNames,
                    width: imageWidth,
                    height: imageHeight,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      const Text('전구 색깔'),
                      Switch(
                        value: colorSwitch,
                        onChanged: (value) {
                          colorSwitch = value;
                          onoffCol();
                        },
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      const Text('전구 확대'),
                      Switch(
                        value: zoomSwitch,
                        onChanged: (value) {
                          zoomSwitch = value;
                          zoomFun();
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      const Text('전구 스위치'),
                      Switch(
                        value: onoffSwitch,
                        onChanged: (value) {
                          onoffSwitch = value;
                          onoffFun();
                        },
                      ),
                    ],
                  ),
                )
              ],
              
            )
          ],
        ),
      ),
    );
  }
  // --- Functions ---
  zoomFun() {
    if(zoomSwitch) {
      // 확대가 되어있는 상태일때 스위치가 변경되었음. -> 축소가 되어야 함
      imageWidth = 200;
      imageHeight = 400;
    }
    else {
      imageWidth = 100;
      imageHeight = 200;
    }
    setState(() {});
  }
  onoffFun() {
    if(onoffSwitch) {
      imageNames = 'images/lamp_on.png';
    }
    else {
      // 전구가 켜져있는 상태일때 스위치가 변경되었음. true 에서 false로 변경 후 onoffFun() 실행.
      // 불이 꺼져야 한다.
      imageNames = 'images/lamp_off.png';
    }
    setState(() {});
  }

    onoffCol() {
    if(colorSwitch) {
      imageNames = 'images/lamp_red.png';
    }
    else {
      // 전구가 켜져있는 상태일때 스위치가 변경되었음. true 에서 false로 변경 후 onoffFun() 실행.
      // 불이 꺼져야 한다.
      imageNames = 'images/lamp_on.png';
    }
    setState(() {});
  }
} // End