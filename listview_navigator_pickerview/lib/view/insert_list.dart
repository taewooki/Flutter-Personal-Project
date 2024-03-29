import 'package:flutter/material.dart';

import '../model/message.dart';

class InsertList extends StatefulWidget {
  const InsertList({super.key});

  @override
  State<InsertList> createState() => _InsertListState();
}

class _InsertListState extends State<InsertList> {

late TextEditingController textEditingController;
late bool onoffSwitch;

@override
  void initState() {   
    super.initState();
    textEditingController = TextEditingController();
    onoffSwitch = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('add View'),
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                    const Text('구매'),
                    Switch(
                    value: onoffSwitch,
                    onChanged: (value) {
                    onoffSwitch = value;
                        onoffFun();
                    },
              ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  Message.workList
                ),
                SizedBox( width: 10,),
                Image.asset(Message.imagePath,
              ),
              ],
            ),            
            
            TextField(
              controller: textEditingController,
              decoration: const InputDecoration(
                labelText: '목록을 입력하세요',
              ),
              keyboardType: TextInputType.text,
            ),
            ElevatedButton(
              onPressed: () {
                if(textEditingController.text.trim().isNotEmpty){
                  addlist();
                }
                Navigator.pop(context);
              },  
              child: const Text('OK'),
            ),
          ],
        ),
      ),
    );
  }
  // Functions
  addlist(){
    Message.imagePath ='images/pencil.png';
    Message.workList= textEditingController.text;
    Message.action = true;  }

  onoffFun() {  
  'images/cart.png';   
  }
}