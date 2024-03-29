import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  final String userid;

  const SecondPage(
    {
      super.key,
      required this.userid,
    }
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon : const Icon(Icons.sunny),
          color: Colors.red
        ),
        title: Text(
          '${userid}님! 환영합니다',
          style: const TextStyle(
            color: Colors.white
          ),
        ),
      ),
      backgroundColor: Colors.black,
      body: const Center(
        child: CircleAvatar(
          backgroundImage: AssetImage(
            'images/coin.jpeg',
          ),
          radius: 140,
        ),
      ),
    );
  }
}