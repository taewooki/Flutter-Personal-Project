import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Image Padding"),
        backgroundColor: Colors.amberAccent, 
      ),
      body: SingleChildScrollView (
          child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                padding: const EdgeInsets.all(20.0),
                child: Image.asset(
                  'images/pca1.png',
                  width:150,
               ),
              ),
              ),
                 Padding(
                   padding: const EdgeInsets.all(20.0),
                   child: Image.asset(
                                   'images/pca2.png',
                                   width:150,                                 
                                   ),
                 ),
                 Padding(
                   padding: const EdgeInsets.all(20.0),
                   child: Image.asset(
                                   'images/pca1.png', 
                                   width:150,                         
                                   ),
                 ),
                                  Padding(
                   padding: const EdgeInsets.all(20.0),
                   child: Image.asset(
                                   'images/pca2.png', 
                                   width:150,                         
                                   ),
                 ),
                 Padding(
                   padding: const EdgeInsets.all(20.0),
                   child: Image.asset(
                                   'images/pca2.png', 
                                   width:150,                         
                                   ),
                 ),
            ],
          ),
        ),     
      ),

    );
  }
}