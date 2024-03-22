import 'dart:io';

import 'package:flutter/material.dart';

class Sendmail extends StatelessWidget {
  const Sendmail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('send email'),
      ),
      body: Column(
        children: [
          Text('data1'),
          Text('data2'),
          Text('data3'),
        ],        
      ),
    );
  }
}