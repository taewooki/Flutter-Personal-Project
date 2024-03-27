import 'package:flutter/material.dart';

import '../model/animal_list.dart';

class FirstPage extends StatefulWidget {
  final List<Animal> list;

  const FirstPage({super.key, required this.list});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView.builder(
          itemCount: widget.list.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => _showDialog(index),
              child: Card(
                child: Row(
                  children: [
                    Image.asset(
                      widget.list[index].imagePath,
                      width: 100,
                    ),
                    Text('       ${widget.list[index].animalName}')
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  // --- Functions ---
  _showDialog(index){
    showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: const Color.fromARGB(49, 255, 193, 7),
      builder: (context) {
        return AlertDialog(
          title: Text(
            widget.list[index].animalName,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),
          ),
          content: Row(
            children: [
              Image.asset(
                widget.list[index].imagePath,
                width: 50,
              ),
              Text(
                '이 동물은 ${widget.list[index].kind} 입니다. \n'
                '${widget.list[index].flyExist ? "날 수 있습니다." : "날 수 없습니다."}'
              )
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(), 
              child: const Text('종료'),
            ),
          ],
        );
      },
    );
  }


} // End