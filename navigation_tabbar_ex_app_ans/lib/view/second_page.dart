import 'package:flutter/material.dart';

import '../model/model.dart';

class SecondPage extends StatefulWidget {
  final List<Animal> list;

  const SecondPage({super.key, required this.list});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  // Property
  late TextEditingController nameController;
  late int _radioValue; // Radio Button
  late bool flyExist; // Check Box
  late String _imagePath; // Image 선택
  late String imageName; // Image 이름

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    _radioValue = 0;
    flyExist = false;
    _imagePath = '';
    imageName = '';
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                label: Text('이름을 입력해 주세요.')
              ),
              keyboardType: TextInputType.text,
              maxLines: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Radio(
                      value: 0,
                      groupValue: _radioValue,
                      onChanged: (value) => _radioChange(value),
                    ),
                    const Text('양서류')
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: 1,
                      groupValue: _radioValue,
                      onChanged: (value) => _radioChange(value),
                    ),
                    const Text('파충류')
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: 2,
                      groupValue: _radioValue,
                      onChanged: (value) => _radioChange(value),
                    ),
                    const Text('포유류')
                  ],
                ),
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
                )
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
                      _imagePath = 'images/dog.png';
                      imageName = '강아지';
                      setState(() {});
                    },
                    child: Image.asset(
                      'images/dog.png',
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
                ],
              ),
            ),
            Text(imageName),
            ElevatedButton(
              onPressed: () => _showDialog(),
              child: const Text('동물 추가하기')
            )
          ],
        ),
      ),
    );
  }

  // -- Functions --
  _radioChange(value) {
    _radioValue = value;
    setState(() {});
  }

  _showDialog() {
    var animal = Animal(
      imagePath: _imagePath,
      animalName: nameController.text,
      kind: getKind(_radioValue),
      flyExist: flyExist
    );

    showDialog(
      context: context,
      builder: (BuildContext buildContext) {
        return AlertDialog(
          title: const Text(
            '동물 추가하기',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),
          ),
          content: Text(
            '이 동물의 이름은 ${animal.animalName} 입니다.\n'
            '또한 이 동물의 종류는 ${animal.kind} 입니다. \n'
            '이 동물은 날 수 ${animal.flyExist ? '있' : '없'}습니다.\n\n'
            '이 동물을 추가하시겠습니까?'
          ),
          actions: [
            TextButton(
              onPressed: () {
                widget.list.add(animal);
                Navigator.of(buildContext).pop();
              },
              child: const Text('예')
            ),
            TextButton(
              onPressed: () => Navigator.of(buildContext).pop(),
              child: const Text('아니오')
            )
          ],
        );
      },
    );
  }

  String getKind(radioValue) {
      String returnValue = ''; 

      switch(radioValue) {
        case 0 :
          returnValue = '양서류';
          break;
        case 1 :
          returnValue = '파충류';
          break;
        case 2 :
          returnValue = '포유류';
          break;
      }

      return returnValue;
    }

} // End