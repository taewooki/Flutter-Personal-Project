import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Drawer'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {
              //
            },
            icon: Icon(Icons.search),
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Text('Drawer'),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage("images/pikachu-1.png"),
              ),
              otherAccountsPictures: [
                CircleAvatar(
                  backgroundImage: AssetImage("images/pikachu-2.png"),
                ),
                CircleAvatar(
                  backgroundImage: AssetImage("images/pikachu-3.png"),
                ),
              ],
              accountName: const Text('Pikachu'),
              accountEmail: const Text('pikachu@naver.com'),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.home,
                color: Colors.red,
              ),
              title: Text('Home'),
              onTap: () {
                //print('Home is clicked'),
              },
            ),
            ListTile(
              leading: Icon(
                Icons.settings,
                color: Colors.black,
              ),
              title: Text('설정'),
              onTap: () {
                //print('Home is clicked'),
              },
            ),
            ListTile(
              leading: Icon(
                Icons.question_answer,
                color: Colors.black,
              ),
              title: Text('자주 묻는 질문'),
              onTap: () {
                //print('Home is clicked'),
              },
            ),
          ],
        ),
      ),
    );
  }
}
