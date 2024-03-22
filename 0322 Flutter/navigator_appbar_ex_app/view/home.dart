import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigator_AppBar'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        actions: [
          IconButton(onPressed: () => Navigator.pushNamed(context, '/send'), icon: const Icon(Icons.email)),
          IconButton(onPressed: () => Navigator.pushNamed(context, '/received'), icon: const Icon(Icons.email_outlined))
        ],
        toolbarHeight: 50,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/send'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)
                )
              ),
              child: const Text('보낸 편지함'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/received'),
              style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5)
              )
              ),
              child: const Text('받은 편지함'),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                color: Colors.red
              ),
              currentAccountPicture : CircleAvatar(
                backgroundImage: AssetImage('images/image1.jpg'),
              ),
              accountName: Text('파이리'),
              accountEmail: Text('fire@naver.com'),
            ),
            ListTile(
              leading: Icon(
                Icons.email,
                color: Colors.blue,
              ),
              title: Text('보낸 편지함'),
            ),
            ListTile(
              leading: Icon(
                Icons.email_outlined,
                color: Colors.red,
              ),
              title: Text('받은 편지함'),
            ),
          ],
        ),
      ),
    );
  }
}