import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alert Dialog with Gesture'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => _showDialog(context),
              child: const Text(
                'Hello World'
                ),
              ),
          ],
        ),
      ),
    );
  }
  //------Funmctions------
  _showDialog(BuildContext context){
    showDialog(
      context: context,      
      builder: (BuildContext ctx){
        return AlertDialog(
          backgroundColor: Colors.amber,
          title: const Text('Alert Title'),
          content: const Text("Hello World를 \nTouch 했습니다."),
          actions: [
            Center(
              child: TextButton(
                onPressed: () => Navigator.of(ctx).pop(),
                child: const Text('종료'),
              ),
            ),
          ],
        );
      },
      );
  }

} // End