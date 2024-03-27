import 'package:flutter/material.dart';
import 'package:tabbar_app/view/first_page.dart';
import 'package:tabbar_app/view/second_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {

  // Property
  late TabController tController;

  @override
  void initState() {
    super.initState();
    tController = TabController(
      length: 2,
      vsync: this
    );
  }

  @override
  void dispose() {
    // 앱이 종료되기 전에 TabBar를 정리해주어야 함.
    tController .dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Tab Bar Test'),
      // ),
      body: TabBarView(
        controller: tController,
        children: [
          FirstPage(),
          SecondPage(),
        ]
      ),
      bottomNavigationBar: Container(
        color: Colors.yellow,
        height: 200,
        child: TabBar(
          controller: tController,
          labelColor: Colors.green,
          indicatorColor: Colors.red,
          indicatorWeight: 4,
          tabs: [
            Tab(
              icon: Image.asset(
                'images/flower_01.png',
                width: 50,
              ),
              text: 'One',
            ),
            // VerticalDivider(
            //   color: Colors.black,
            // ),
            Tab(
              icon: Icon(Icons.looks_two_outlined),
              text: 'Two',
            ),
          ],
        ),
      ),
    );
  }
}