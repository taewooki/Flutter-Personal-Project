import 'package:flutter/material.dart';

class DetailView extends StatefulWidget {
  
  final String imageName;

  const DetailView(
    {
      super.key,
      required this.imageName,
    }
  );

  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flower'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              widget.imageName
            )
          ],
        ),
      ),
    );
  }
}