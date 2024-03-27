import 'package:flutter/material.dart';
import 'package:listview_todo_app/model/message.dart';
import 'package:listview_todo_app/model/todo_list.dart';
import 'package:listview_todo_app/view/detail_list.dart';

class TableList extends StatefulWidget {
  const TableList({super.key});

  @override
  State<TableList> createState() => _TableListState();
}

class _TableListState extends State<TableList> {
  // Property
  late List<TodoList> todoList;

  @override
  void initState() {
    super.initState();
    todoList = [];
    addData();
  }

  addData() {
    // 1번째 DataSet
    todoList.add(TodoList(imagePath: 'images/cart.png', workList: '책 구매'));
    // 2번째 DataSet
    todoList.add(TodoList(imagePath: 'images/clock.png', workList: '철수와 약속'));
    // 3번째 DataSet
    todoList.add(TodoList(imagePath: 'images/pencil.png', workList: '스터디 준비하기'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main View'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/insert').then((value) => rebuildData());
            },
            icon: const Icon(Icons.add_outlined),
          ),
        ],
      ),
      body: Center(
        child: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(10, 3, 10, 3),
              child: Dismissible(
                direction: DismissDirection.endToStart,
                key: ValueKey(todoList[index]),
                onDismissed: (direction) {
                  todoList.remove(todoList[index]);
                  setState(() {});
                },
                background: Container(
                  color: Colors.red,
                  alignment: Alignment.centerRight,
                  child: const Icon(
                    Icons.delete_forever,
                  size: 50,
                  ),
                ),
                child: GestureDetector(
                  onTap: () {
                    Message.workList = todoList[index].workList;
                    Message.imagePath = todoList[index].imagePath;
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const DetailList()),
                    );
                  },
                  child: Card(
                    color: index % 2 == 0 ? Colors.amber : Colors.green,
                    child: Row(
                      children: [
                        Image.asset(
                          todoList[index].imagePath,
                          width: 100,
                          height: 100,
                        ),
                        Text(
                          todoList[index].workList,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
  //Functions
  rebuildData(){
    if(Message.action){
    todoList.add(TodoList(imagePath: Message.imagePath, workList: Message.workList));
    Message.action = false;
    setState(() {});

    }
  }
} // End
