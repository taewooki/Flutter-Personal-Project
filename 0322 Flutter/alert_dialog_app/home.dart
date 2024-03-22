import 'package:flutter/material.dart';

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
              child: const Text('Hello World!!')
            )
          ],
        ),
      ),
    );
  } // build

  // ---- Functions ----

  _showDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          backgroundColor: Colors.amber,
          title: const Text('Alert Title'),
          content: const Text('Hello World를 \nTap 했습니다.'),
          actions: [
            Center(
              child: Column(
                children: [
                  TextButton(
                    onPressed: () => Navigator.of(dialogContext).pop(),
                    child: const Text('종료'),
                  )
                ],
              ),
            )
          ],
        );
      },
    );
  }

} // End