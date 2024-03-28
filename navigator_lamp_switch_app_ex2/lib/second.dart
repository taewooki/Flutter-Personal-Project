import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {

    // Property
late String imageNames;
late bool onoffSwitch;
late double imageWidth;
late double imageHeight;

@override
  void initState() {  
    super.initState();
    onoffSwitch = true;
    imageNames = 'images/lamp_on.png';
    imageWidth = 100;
    imageHeight = 200;
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
          Text('Off'),
            Switch(
              value: onoffSwitch,
              onChanged: (value){
                onoffSwitch = value;
                onoffCheck();
              }
            ),
          ],
        ),
      ),
    );
  }
  // functions
  onoffCheck(){
    if(onoffSwitch){
      imageNames = 'images/lamp_on.png';
    }
    else{
      imageNames = 'images/lamp_off.png';
    }
    setState(() {});
  }

}//end