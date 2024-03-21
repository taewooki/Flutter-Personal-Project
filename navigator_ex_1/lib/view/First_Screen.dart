import 'package:flutter/material.dart';
import 'package:navigator_ex_1/view/Second_Image.dart';

import 'Home.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Screen 1st'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        
        children: [ 
        ElevatedButton(
          onPressed: () {
            Navigator.push(context,MaterialPageRoute(builder: (context){
              return const Home();
            }));
          },
          child: const Text('Go to the Home page'),
        ),
        ElevatedButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return const SecondImage();
            }));
          },
          child: const Text('Go to the second Image'),
        ),
        ],
      ),
      ),


    );
  }
}