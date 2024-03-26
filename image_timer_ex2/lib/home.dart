import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  late List str;
  late int currentCharacter;
  late String character;

  @override
  void initState() { 
    super.initState();
    String data = '대한민국';
    str = data.split('');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LED 광고'),        
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [            
            Text(),
                      
          ],
        ),
      ),
    );
  }
  changeCharacter(String character){
    currentCharacter++;
    if(currentCharacter <= str.length){
      currentCharacter = 0;
      character = str[currentCharacter];
    }else{
      character += str[currentCharacter];
    }
    setState(() {});
  }
}//End