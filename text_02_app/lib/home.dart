import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text with Colum and Row'),
      ),
      body: const Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.email_rounded,
                color: Colors.red,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.account_circle,
                color: Colors.blue,                
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.account_balance
              
              ),
            ), 
          ],
        ), 
        ),
         ), 
          ],
        ),
      ),
    );
  }
}