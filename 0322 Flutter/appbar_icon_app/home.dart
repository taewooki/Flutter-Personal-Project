import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          children: [
            Text(
              style: TextStyle(
                fontSize: 20,
                backgroundColor: Colors.amberAccent,
                color: Colors.red
              ),
              'AppBar Icon'
            ),
            Text('---------1'),
            Text('---------1'),
            Text('---------1'),
          ],
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: (){},
          icon: const Icon(Icons.menu),
        ),
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.email)),
          IconButton(onPressed: (){}, icon: const Icon(Icons.add_alarm)),
          IconButton(onPressed: (){}, icon: const Icon(Icons.add_outlined)),
          GestureDetector(
            onTap: (){
              print('smile image is tapped');
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset(
                'images/smile.png',
                width: 30,
              ),
            ),
          ),
        ],
        backgroundColor: Colors.lightBlueAccent,
        toolbarHeight: 200,
        toolbarOpacity: 0.5,

      ),
    );
  }
}