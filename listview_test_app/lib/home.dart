import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Property
  late List<int> todoList;
  late List<String> todoList2;

  @override
  void initState() {
    super.initState();
    todoList = [];
    todoList2 = [];
    addData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main View'),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: todoList2.length,
          itemBuilder: (context, index) {
            return SizedBox(
              height: 80,
              child: Card(
                color: Colors.blue,
                child: Center(
                  child: Text(
                    todoList2[index],
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white
                    ),
                  ),
                ),
              ),
            );
          }
        ),
      ),
    );
  }

  // -- Functions
  addData() {
    for(int i=1; i<=1000; i++) {
      todoList.add(i);
    }
    todoList2.add('James');
    todoList2.add('Cathy');
    todoList2.add('관우');
    todoList2.add('장비');
    todoList2.add('여포');
    todoList2.add('유비');
  }

} // End