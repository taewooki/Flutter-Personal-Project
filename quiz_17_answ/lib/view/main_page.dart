import 'package:flutter/material.dart';

import '../model/message.dart';
import '../model/model.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {

  // Property
  late List<Model> todoList;

  @override
  void initState() {
    super.initState();
    todoList = [];
    addList();
  }

  addList() {
    todoList.add(Model(imagePath: 'images/cart.png', work: '장 보기'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main View'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () => Navigator.pushNamed(context, '/insert').then((value) => rebuildData()),
            icon: const Icon(Icons.add)
          )
        ],
      ),
      body: Center(
        child: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Message.imagePath = todoList[index].imagePath;
                  Message.work = todoList[index].work;
                  Navigator.pushNamed(context, '/detail');
                },
                child: Card(
                  child: Row(
                    children: [
                      Image.asset(
                        todoList[index].imagePath
                      ),
                      Text(
                        todoList[index].work
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  // -- Functions
  rebuildData() {
    if(Message.action) {
      todoList.add(Model(imagePath: Message.imagePath, work: Message.work));
      Message.action = false;
      setState(() {});
    }
  }

} // End