import 'package:flutter/material.dart';

import '../model/model.dart';

class FirstPage extends StatefulWidget {
  final List<Animal> list;

  const FirstPage(
    {
      super.key,
      required this.list
    }
  );

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
                      width: 130,
                    ),
                    Text(
                      '   ${widget.list[index].animalName}',
                      style: const TextStyle(
                        fontSize: 25
                      ),
                    )
              
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
  
  // -- Functions
  _showDialog(int index) {
    showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Color.fromARGB(103, 239, 212, 132),
      builder: (BuildContext buildContext) {
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
                '    이 동물은 ${widget.list[index].kind} 입니다. \n'
                '    날 수 ${widget.list[index].flyExist ? '있' : '없'}습니다.'
              )
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () => Navigator.of(buildContext).pop(),
              child: const Text('확인')
            )
          ],
        );
      },
    );
  }

} // End