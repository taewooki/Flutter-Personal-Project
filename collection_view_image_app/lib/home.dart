import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  late List<String> flowerList;

  @override
  void initState() {  
    super.initState();
    flowerList = [
      'images/flower_01.png',
      'images/flower_02.png',
      'images/flower_03.png',
      'images/flower_04.png',
      'images/flower_05.png',
      'images/flower_06.png',
    ];

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flower Garden'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,        
      ),
      body: Center(
        child: GridView.builder(
          itemCount: flowerList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 3,
            ), 
          itemBuilder:(context, index) {
            return Container(
              height: 50,
              color: Colors.grey,
              child: Card(
                color: Colors.blue,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(flowerList[index]),               
              
                  ],
              
                ),
              ),
            );
            
          },
          ),
      ),
    );
  }
}