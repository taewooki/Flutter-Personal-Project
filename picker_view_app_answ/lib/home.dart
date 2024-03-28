import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Property
  late List _imageName;
  late int _selectedItem;

  @override
  void initState() {
    super.initState();
    _imageName = [
      'w1.jpg',
      'w2.jpg',
      'w3.jpg',
      'w4.jpg',
      'w5.jpg',
      'w6.jpg',
      'w7.jpg',
      'w8.jpg',
      'w9.jpg',
      'w10.jpg',
    ];
    _selectedItem = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pciker View'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Picker View로 이미지 선택',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(
              width: 300,
              height: 200,
              child: CupertinoPicker(
                itemExtent: 100,
                scrollController: FixedExtentScrollController(initialItem: 0),
                onSelectedItemChanged: (value) {
                  _selectedItem = value;
                  setState(() {});
                },
                children: List.generate(_imageName.length, (index) => Center(
                  child: Image.asset(
                    'images/${_imageName[index]}',
                    width: 60,
                  ),
                ))
                  // [
                  // Image.asset(
                  //   'images/${_imageName[0]}',
                  //   width: 40,
                  //   height: 30,
                  // ),
                  // Image.asset(
                  //   'images/${_imageName[1]}',
                  //   width: 40,
                  //   height: 30 ,
                  // ),
                  // Image.asset(
                  //   'images/${_imageName[2]}',
                  //   width: 40,
                  //   height: 30 ,
                  // ),
                  // Image.asset(
                  //   'images/${_imageName[3]}',
                  //   width: 40,
                  //   height: 30 ,
                  // ),
                  // Image.asset(
                  //   'images/${_imageName[4]}',
                  //   width: 40,
                  //   height: 30 ,
                  // ),
                  // Image.asset(
                  //   'images/${_imageName[5]}',
                  //   width: 40,
                  //   height: 30 ,
                  // ),
                  // Image.asset(
                  //   'images/${_imageName[6]}',
                  //   width: 40,
                  //   height: 30 ,
                  // ),
                  // Image.asset(
                  //   'images/${_imageName[7]}',
                  //   width: 40,
                  //   height: 30 ,
                  // ),
                  // Image.asset(
                  //   'images/${_imageName[8]}',
                  //   width: 40,
                  //   height: 30 ,
                  // ),
                  // Image.asset(
                  //   'images/${_imageName[9]}',
                  //   width: 40,
                  //   height: 30 ,
                  // ),
                  // ]
              ),
            ),
            Text(
              'Selected Item : ${_imageName[_selectedItem]}'
            ),
            SizedBox(
              height: 300,
              child: Image.asset(
                'images/${_imageName[_selectedItem]}',
                width: 400,
                height: 300,
                fit: BoxFit.fill,
              ),
            )
          ],
        ),
      ),
    );
  }
}