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
  late String _switch;
  
  @override
  void initState() {
    super.initState();
    _lampImage = 'images/lamp_on.png';
    _lampWidth = 150;
    _lampHeight = 300;    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alert를 이용한 메시지 출력'),
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
                  Image.asset(
                    _lampImage,
                    width: _lampWidth,
                    height: _lampHeight,
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [           
                
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () => 'images/lamp_on.png', 
                        child: const Text('켜기'),
                      ),
                    ),
                    const SizedBox(width: 15,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () => 'images/lamp_off.png', 
                        child: const Text('끄기'),
                      ),
                    )
                  ],
                ),
              ],
            ),            
          ],
        ),
      ),
    );
  }
  // -- Functions



} // End