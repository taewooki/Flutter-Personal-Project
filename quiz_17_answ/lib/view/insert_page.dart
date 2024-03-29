import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/message.dart';

class InsertView extends StatefulWidget {
  const InsertView({super.key});

  @override
  State<InsertView> createState() => _InsertViewState();
}

class _InsertViewState extends State<InsertView> {
  // Property
  late TextEditingController teController;
  late List<String> imageName;
  late int _selectedItem;

  @override
  void initState() {
    super.initState();
    teController = TextEditingController();
    imageName = [
      'images/cart.png',
      'images/clock.png',
      'images/pencil.png',
    ];
    _selectedItem = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add View"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  imageName[_selectedItem],
                  width: 100,
                  fit: BoxFit.fill,
                ),
                SizedBox(
                  width: 200,
                  height: 200,
                  child: CupertinoPicker(
                    itemExtent: 70,
                    onSelectedItemChanged: (value) {
                      _selectedItem = value;
                      setState(() {});
                    },
                    children: List.generate(imageName.length, (index) => Center(
                      child: Image.asset(
                        imageName[index],
                        width: 50,
                      ),
                    ))
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: teController,
                decoration: const InputDecoration(
                  label: Text('목록을 입력하세요')
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if(teController.text.trim().isNotEmpty) {
                  insertAction();
                  Message.action = true;
                  Navigator.pop(context);
                }
              },
              child: const Text('확인')
            )
          ],
        ),
      ),
    );
  }

  // -- Functions
  insertAction() {
    Message.work = teController.text;
    Message.imagePath = imageName[_selectedItem];
  }

} // End