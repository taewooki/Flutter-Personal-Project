import 'package:flutter/material.dart';
import '../model/animal_list.dart';

class SecondPage extends StatefulWidget {
  final List<Animal> list;
  const SecondPage({super.key, required this.list});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  // Property
  late TextEditingController nameController; // TextField
  late int _radioValue; // Radio Button
  late bool flyExist; // Check box
  late String _imagePath; // Image 선택
  late String imageName; // Image 이름

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    _radioValue = 0;
    flyExist = false;
    _imagePath = "";
    imageName = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: nameController,
              keyboardType: TextInputType.text,
              maxLines: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Radio(
                  value: 0,
                  groupValue: _radioValue,
                  onChanged: (value) => _radioChange(value),
                ),
                const Text('양서류'),
                Radio(
                  value: 1,
                  groupValue: _radioValue,
                  onChanged: (value) => _radioChange(value),
                ),
                const Text('파충류'),
                Radio(
                  value: 2,
                  groupValue: _radioValue,
                  onChanged: (value) => _radioChange(value),
                ),
                const Text('포유류')
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text('날 수 있나요?'),
                Checkbox(
                  value: flyExist,
                  onChanged: (value) {
                    flyExist = value!;
                    setState(() {});
                  },
                ),
              ],
            ),
            SizedBox(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  GestureDetector(
                    onTap: () {
                      _imagePath = 'images/cow.png';
                      imageName = '젖소';
                      setState(() {});
                    },
                    child: Image.asset(
                      'images/cow.png',
                      width: 80,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _imagePath = 'images/pig.png';
                      imageName = '돼지';
                      setState(() {});
                    },
                    child: Image.asset(
                      'images/pig.png',
                      width: 80,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _imagePath = 'images/bee.png';
                      imageName = '벌';
                      setState(() {});
                    },
                    child: Image.asset(
                      'images/bee.png',
                      width: 80,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _imagePath = 'images/cat.png';
                      imageName = '고양이';
                      setState(() {});
                    },
                    child: Image.asset(
                      'images/cat.png',
                      width: 80,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _imagePath = 'images/fox.png';
                      imageName = '여우';
                      setState(() {});
                    },
                    child: Image.asset(
                      'images/fox.png',
                      width: 80,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _imagePath = 'images/monkey.png';
                      imageName = '원숭이';
                      setState(() {});
                    },
                    child: Image.asset(
                      'images/monkey.png',
                      width: 80,
                    ),
                  ),
                ],
              ),
            ),
            Text(imageName),
            ElevatedButton(
              onPressed: () => _showDialog(),
              child: const Text('동물 추가하기'),
            ),
          ],
        ),
      ),
    );
  }

  // --- Functions ----
  _radioChange(value) {
    _radioValue = value;
    setState(() {});
  }

  _showDialog() {
    var aniaml = Animal(
        imagePath: _imagePath,
        animalName: nameController.text,
        kind: getKind(_radioValue),
        flyExist: flyExist);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            '동물 추가하기',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            '이 동물은 ${aniaml.animalName} 입니다. \n'
            '또 이 동물의 종류는 ${aniaml.kind} 입니다. \n'
            '이 동물은 ${aniaml.flyExist ? "날 수 있습니다." : "날 수 없습니다."}\n'
            '이 동물을 추가 하시겠습니까?'
          ),
          actions: [
            TextButton(
              onPressed: () {
                widget.list.add(aniaml);
                Navigator.of(context).pop();
              }, 
              child: const Text('예'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(), 
              child: const Text('아니오'),
            ),
          ],
        );
      },
    );
  }

  String getKind(int radioValue) {
    String returnValue = "";
    switch (radioValue) {
      case 0:
        returnValue = "양서류";
        break;
      case 1:
        returnValue = "파충류";
        break;
      case 2:
        returnValue = "포유류";
        break;
    }
    return returnValue;
  }
} // End