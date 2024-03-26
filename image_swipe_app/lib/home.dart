import 'package:flutter/material.dart';
import 'package:simple_gesture_detector/simple_gesture_detector.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  // Property
  // Image 배열
  late List imageName;

  // Image 배열 현재 번호
  late int currentImage;

  @override
  void initState() {
    
    super.initState();
    imageName = [
      'flower_01.png',
      'flower_02.png',
      'flower_03.png',
      'flower_04.png',
      'flower_05.png',
      'flower_06.png',
    ];

    currentImage = 0;


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('무한 이미지 반복'),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),
      body: SimpleGestureDetector(
        onHorizontalSwipe: (direction) => _onHorizontalSwipe(direction),
        onVerticalSwipe:(direction) => _onVerticalSwipe(direction),
        onDoubleTap: () => _onDoubleTap(),       
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                imageName[currentImage]
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  'images/${imageName[currentImage]}',
                  width: 300,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(                  
                  onPressed: () => onPre(), 
                    child: const Text('<< 이전'),
                                        
                    ),
                    
                    
                  ElevatedButton(
                    onPressed:() => onNext(),
                    child: const Text('다음 >>')),                  
                    ],              
                  
              ),
            ],
          ),
        ),
      ),
    );
  }

  //-----functions----
  _onHorizontalSwipe(direction){
    // Swiping  오른쪽에서 왼족으로 
    if(direction == SwipeDirection.left){
      currentImage += 1;
      if(currentImage >= imageName.length){
        currentImage = 0;
      }
    }else{
      currentImage -= 1;
      if(currentImage <0){
        currentImage = imageName.length - 1;
      }
    }    
    setState(() {});
  }

  _onVerticalSwipe(direction){
    // Swiping  아래에서 위로  
    if(direction == SwipeDirection.up){
      currentImage += 1;
      if(currentImage >= imageName.length){
        currentImage = 0;
      }
    }else{
      currentImage -= 1;
      if(currentImage <0){
        currentImage = imageName.length - 1;
      }
    }    
    setState(() {});
  }
  _onDoubleTap(){
    // doubleTap    
      currentImage += 1;
      if(currentImage >= imageName.length){
        currentImage = 0;
      }    
    setState(() {});
  }

  onPre(){  
      currentImage -= 1;
      if(currentImage <0){
        currentImage = imageName.length - 1;
      }
      setState(() {});
    }  
  

  onNext(){
      currentImage += 1;
      if(currentImage >= imageName.length){
        currentImage = 0;
      }       
    setState(() {});
  }    
  



} //End