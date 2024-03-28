import 'package:flutter/material.dart';

import '../model/message.dart';
import 'detail_page.dart';
import 'insert_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List<String> heroList;

  @override
  void initState() {
    super.initState();
    heroList = [
      '유비',
      '관우',
      '장비',
      '조자룡',
      '손책',
      '손권',
      '황충',
      '조조',
      '방통',
      '주유',
      '제갈량',
      '사마의',
      '사마사',
      '동탁',
    ];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('삼국지 인물'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return const InsertPage();
                },
                )
              ).then((value) {
                if(Message.status) {
                  heroList.add(Message.heroName);
                  Message.status = false;
                  setState(() {});
                }
              },);;
            },
            icon: const Icon(Icons.edit)
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          itemCount: heroList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 20, // 간격
            mainAxisSpacing: 10
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return DetailView(heroName : heroList[index]);
                },
              ));
              },
              child: Container(
                color: Colors.amber,
                child: Card(
                  color: Colors.yellow,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(heroList[index])
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
}