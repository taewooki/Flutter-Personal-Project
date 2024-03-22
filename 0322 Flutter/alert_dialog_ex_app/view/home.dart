import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Alert and push'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: GestureDetector(
          onTap: () => _showDialog(context),
          child: (
            Text("Move the 2nd page.")
          ),
        ),
      )
    );
  }

  // Function
  _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: const Text('Page 이동'),
          content: const Text('아래의 버튼을 누르면 페이지 이동을 합니다.'),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(dialogContext).pop();
                Navigator.pushNamed(context, '/secondPage');
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
                ),
                backgroundColor: Colors.green,
                foregroundColor: Colors.white
              ),
              child: const Text('Page 이동')
            )
          ],
        );
      }

    );
  }
}