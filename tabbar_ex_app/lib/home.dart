import 'package:flutter/material.dart';
import 'package:tabbar_ex_app/view/first_page.dart';
import 'package:tabbar_ex_app/view/second_page.dart';

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
    tController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('이미지 탭바'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: false,
      ),
      body: TabBarView(
        controller: tController,
        children: [
          FirstPage(),
          SecondPage(),
        ]
      ),
      bottomNavigationBar: Container(
        height: 100,
        color: Colors.green,
        child: TabBar(
          indicatorColor: Colors.white,
          labelColor: Colors.white,
          controller: tController,
          tabs: [
            Tab(
              icon: Icon(Icons.alarm),
              text: 'screen #1',
            ),
            Tab(
              icon: Icon(Icons.accessible),
              text: 'screen #2',
            )
          ],
        ),
      ),
    );
  }
}