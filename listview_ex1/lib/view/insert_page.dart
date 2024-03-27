import 'package:flutter/material.dart';
import '../model/message.dart';

class InsertView extends StatefulWidget {
  const InsertView({super.key});

  @override
  State<InsertView> createState() => _InsertViewState();
}

class _InsertViewState extends State<InsertView> {
  // Property
  late bool firstSwitch;
  late bool secondSwitch;
  late bool thirdSwitch;
  late TextEditingController teController;

  @override
  void initState() {
    super.initState();
    firstSwitch = true;
    secondSwitch = false;
    thirdSwitch = false;
    teController = TextEditingController();
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
                const Text(
                  '구매',
                  style: TextStyle(
                    fontSize: 20
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Switch(
                    value: firstSwitch,
                    onChanged: (value) {
                      firstSwitch = value;
                      clickSwitch(1);
                    },
                  ),
                ),
                Image.asset(
                  'images/cart.png'
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  '약속',
                  style: TextStyle(
                    fontSize: 20
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Switch(
                    value: secondSwitch,
                    onChanged: (value) {
                      secondSwitch = value;
                      clickSwitch(2);
                    },
                  ),
                ),
                Image.asset(
                  'images/clock.png'
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  '스터디',
                  style: TextStyle(
                    fontSize: 20
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Switch(
                    value: thirdSwitch,
                    onChanged: (value) {
                      thirdSwitch = value;
                      clickSwitch(3);
                    },
                  ),
                ),
                Image.asset(
                  'images/pencil.png'
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
  clickSwitch(int seq) {
    if(seq == 1) {
      secondSwitch = false;
      thirdSwitch = false;
    }
    else if(seq == 2) {
      firstSwitch = false;
      thirdSwitch = false;
    }
    else {
      firstSwitch = false;
      secondSwitch = false;
    }

    if(!firstSwitch & !secondSwitch & !thirdSwitch) {
      firstSwitch = true;
    }
    setState(() {});
  }

  insertAction() {
    Message.work = teController.text;
    if(firstSwitch) {
      Message.imagePath = 'images/cart.png';
    }
    else if(secondSwitch) {
      Message.imagePath = 'images/clock.png';
    }
    else {
      Message.imagePath = 'images/pencil˚.png';
    }
  }

} // End