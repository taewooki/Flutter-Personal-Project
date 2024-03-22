import 'package:flutter/material.dart';
class FirstPage extends StatelessWidget {
  const FirstPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen 1st'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                style: TextStyle(
                  fontSize: 20
                ),
                'Screen 1st'),
            ),
            ElevatedButton.icon(
              onPressed: () => Navigator.pushNamed(context, '1stImage'),
              icon: const Icon(
                Icons.arrow_right_alt_outlined
              ),
              label: const Text('First Image Page')
            )
          ],
        ),
      ),
    );
  }
}