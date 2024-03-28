import 'package:flutter/material.dart';

import '../model/model.dart';
import 'first_page.dart';
import 'second_page.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin{
  // Property
  late TabController tController;
  late List<Animal> animalList;

  @override
  void initState() {
    super.initState();
    animalList = [];
    tController = TabController(length: 2, vsync: this);
    addList();
  }

  @override
  void dispose() {
    tController.dispose();
    super.dispose();
  }

  addList() {
    animalList.add(Animal(animalName: '벌', kind: '곤충', flyExist: true, imagePath: 'images/bee.png'));
    animalList.add(Animal(animalName: '고양이', kind: '포유류', flyExist: false, imagePath: 'images/cat.png'));
    animalList.add(Animal(animalName: '소', kind: '포유류', flyExist: false, imagePath: 'images/cow.png'));
    animalList.add(Animal(animalName: '강아지', kind: '포유류', flyExist: false, imagePath: 'images/dog.png'));
    animalList.add(Animal(animalName: '여우', kind: '포유류', flyExist: false, imagePath: 'images/fox.png'));
    animalList.add(Animal(animalName: '원숭이', kind: '영장류', flyExist: false, imagePath: 'images/monkey.png'));
    animalList.add(Animal(animalName: '돼지', kind: '포유류', flyExist: false, imagePath: 'images/pig.png'));
    animalList.add(Animal(animalName: '늑대', kind: '포유류', flyExist: false, imagePath: 'images/wolf.png'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('동물 친구 찾기'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: TabBarView(
        controller: tController,
        children: [
          FirstPage(list: animalList),
          SecondPage(list: animalList),
        ]
      ),
      bottomNavigationBar: Container(
        height: 70,
        color: Colors.blue,
        child: TabBar(
          indicatorColor: Colors.white,
          controller: tController,
          tabs: const [
            Tab(
              icon: Icon(
                Icons.looks_one,
                color: Colors.yellow,
              ),
            ),
            Tab(
              icon: Icon(
                Icons.looks_two,
                color: Colors.greenAccent,
              ),
            )
          ]
        ),
      ),
    );
  }
}