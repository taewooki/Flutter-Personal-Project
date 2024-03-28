import 'package:flutter/material.dart';

class DetailView extends StatefulWidget {
  final String heroName;

  const DetailView(
    {
      super.key,
      required this.heroName
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
        title: const Text('data'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.heroName
            )
          ],
        ),
      ),
    );
  }
}