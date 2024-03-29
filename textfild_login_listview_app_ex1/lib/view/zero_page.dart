import 'package:flutter/material.dart';
import '../model/animal_list.dart';
import 'first_page.dart';
import 'second_page.dart';


class ZeroPage extends StatefulWidget {
  const ZeroPage({super.key});

  @override
  State<ZeroPage> createState() => _ZeroPageState();
}

class _ZeroPageState extends State<ZeroPage> with SingleTickerProviderStateMixin{

  // Property
  late TabController controller;
  late List<Animal> animalList;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);
    animalList = [];
    addList();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  addList(){
    animalList.add(Animal(
      imagePath: 'images/bee.png', 
      animalName: '벌', 
      kind: "곤충", 
      flyExist: true));

    animalList.add(Animal(
      imagePath: 'images/cat.png', 
      animalName: '고양이', 
      kind: "포유류", 
      flyExist: false));

    animalList.add(Animal(
      imagePath: 'images/cow.png', 
      animalName: '젖소', 
      kind: "포유류", 
      flyExist: false));

    animalList.add(Animal(
      imagePath: 'images/dog.png', 
      animalName: '강아지', 
      kind: "포유류", 
      flyExist: false));

    animalList.add(Animal(
      imagePath: 'images/fox.png', 
      animalName: '여우', 
      kind: "포유류", 
      flyExist: false));

    animalList.add(Animal(
      imagePath: 'images/monkey.png', 
      animalName: '원숭이', 
      kind: "영장류", 
      flyExist: false));

    animalList.add(Animal(
      imagePath: 'images/pig.png', 
      animalName: '돼지', 
      kind: "포유류", 
      flyExist: false));

    animalList.add(Animal(
      imagePath: 'images/wolf.png', 
      animalName: '늑대', 
      kind: "포유류", 
      flyExist: false));

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView Test'),
      ),
      body: TabBarView(
        controller: controller,
        children: [
          FirstPage(list: animalList),
          SecondPage(list: animalList)
        ],
      ),
      bottomNavigationBar: TabBar(
        controller: controller,
        tabs: const [
          Tab(
            icon: Icon(
              Icons.looks_one,
              color: Colors.blue,
            ),
          ),
          Tab(
            icon: Icon(
              Icons.looks_two,
              color: Colors.red
            ),
          )
        ],
      ),
    );
  }
}