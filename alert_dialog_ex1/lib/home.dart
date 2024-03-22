import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert and puch'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,        
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => _showDialog(context),           
            child: const Text(
              'Move the 2nd page'
              ) 
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
          title: const Text('Page 이동'),
          content: const Text("아래의 버튼을 누루면 페이지 이동을 합니 \n 다."),
          actions: [
            Center(
              child: TextButton(
                onPressed: () => Navigator.of(ctx).pop(),
                child: const Text('Page 이동'),
              ),
            ),
          ],
        );
      },
      );
  }


} // End