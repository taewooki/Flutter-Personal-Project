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
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_cart)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
        ],
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text('Drawer')],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage(
                  'images/image1.jpg'
                ),
              ),
              otherAccountsPictures: [
                CircleAvatar(
                  backgroundImage: AssetImage(
                    'images/image2.png'
                  ),
                ),
                CircleAvatar(
                  backgroundImage: AssetImage(
                    'images/image3.gif'
                  ),
                ),
              ],
              accountName: Text('파이리'),
              accountEmail: Text('pikachu@naver.com'),
              decoration: BoxDecoration(
                color: Colors.redAccent,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight : Radius.circular(30),
                )
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.home,
                color: Colors.red,  
              ),
              title: const Text('Home'),
              onTap: () => {print('home')},
            ),
            const ListTile(
              leading: Icon(
                Icons.settings,
                color: Colors.blue,
              ),
              title: Text('설정')
            ),
            const ListTile(
              leading: Icon(
                Icons.question_answer,
                color: Colors.orange,
              ),
              title: Text('자주 묻는 질문')
            )
          ],
        )
      ),
    );
  }
}
