import 'package:flutter/material.dart';
import 'second_page.dart';


class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Frist Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(context,MaterialPageRoute(builder: (context){
              return const SecondPage();
            }));
          },
          child: const Text('Go to the second page'),
        ),
      ),
    );
  }
}