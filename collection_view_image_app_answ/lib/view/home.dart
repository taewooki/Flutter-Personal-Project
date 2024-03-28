import 'package:flutter/material.dart';

import 'detail_view.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  late List<String> flowerList;

  @override
  void initState() {
    super.initState();
    flowerList = [
      'images/flower_01.png',
      'images/flower_02.png',
      'images/flower_03.png',
      'images/flower_04.png',
      'images/flower_05.png',
      'images/flower_06.png',
    ];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flowe Garden'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: GridView.builder(
          itemCount: flowerList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return DetailView(imageName: flowerList[index]);
                },)),
              child: Container(
                color: Colors.grey,
                child: Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0)
                    ),
                    color: Colors.lightBlue,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            flowerList[index],
                            width: 70,
                          ),
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
}