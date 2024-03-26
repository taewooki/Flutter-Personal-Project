import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Property
  late String fileName;
  late bool lampStatus;
  late String errorText;

  @override
  void initState() {
    super.initState();
    fileName = 'images/lamp_on.png';
    lampStatus = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alert를 이용한 메세지 출력'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              fileName,
              width: 300,
              height: 600,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ElevatedButton(
                    onPressed: () => onLamp(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white
                    ),
                    child: const Text('켜기'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ElevatedButton(
                    onPressed: () => offLamp(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white
                    ),
                    child: const Text('끄기'),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  // --- Functions ---
  
  onLamp() {
    if(lampStatus) {
      // Alert 창을 통해 이미 켜져있다고 알려줌.
      errorText = '이미 램프가 켜진 상태입니다.';
      warnAlert();
    }
    else {
      lampStatus = true;
      fileName = 'images/lamp_on.png';
    }
    setState(() {});
  }

  offLamp() {
    if(lampStatus) {
      // Alert 창을 통해 lamp를 Off 할건지 재확인
      showDialog(
        context: context,
        builder: (BuildContext dialogContext) {
          return AlertDialog(
            title: const Text('램프 끄기'),
            content: const Text('정말 램프를 끄시겠습니까?'),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ElevatedButton(
                      onPressed: () {
                        changeLamp();
                        Navigator.of(dialogContext).pop();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white
                      ),
                      child: const Text('예')
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ElevatedButton(
                      onPressed: () => Navigator.of(dialogContext).pop(),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white
                      ),
                      child: const Text('아니오')
                    ),
                  )
                ],
              )
            ],
          );
        }
      );
    }
    else {
      // Alert 창을 통해 이미 꺼져있다고 알려줌.
      errorText = '이미 램프가 꺼져있습니다.';
      warnAlert();
    }
  }

  changeLamp() {
    fileName = 'images/lamp_off.png';
    lampStatus = false;
    setState(() {});
  }

  warnAlert() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text('경고'),
          content: Text(errorText),
          actions: [
            Center(
              child: ElevatedButton(
                onPressed: () => Navigator.of(dialogContext).pop(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                ),
                child: const Text('네, 알겠습니다!')
              ),
            )
          ],
        );
      }
    );
  }

} // End