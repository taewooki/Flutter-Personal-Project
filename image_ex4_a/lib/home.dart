import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 250, 160, 57),
      appBar: AppBar(
        title: const Text('영웅 Card'),
        backgroundColor: Color.fromARGB(255, 233, 99, 3),
        foregroundColor: Colors.white,
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(
                        'images/hero.jpeg',
                      ),
                      radius: 70,
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 4),
                child: Divider(
                  height: 20,
                  color: Colors.black,
                ),
              ),
              Row(
                children: [
                  Text(
                    style: TextStyle(
                      color: Colors.white
                    ),
                    '성웅'
                    )
                ],
              ),
              Row(
                children: [
                  Text(
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30
                    ),
                    '이순신 장군'
                    )
                ],
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 4, 0,4),
                child: Row(
                  children: [
                    Text(
                      style: TextStyle(
                        color: Colors.white
                      ),
                      '전적'
                      )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0,0, 0,10),
                child: Row(
                  children: [
                    Text(
                      style: TextStyle(
                        color: Color.fromARGB(255, 237, 84, 84),
                        fontWeight: FontWeight.bold,
                        fontSize: 30
                      ),
                      '62전 62승'
                      )
                  ],
                ),
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.check_circle_outline),
                      Padding(
                        padding: EdgeInsets.fromLTRB(8, 0,0,0),
                        child: Text('옥포해전'),
                      ),
                    ],
                    ),
                    Row(
                    children: [
                      Icon(Icons.check_circle_outline),
                      Padding(
                        padding: EdgeInsets.fromLTRB(8, 0,0,0),
                        child: Text('사천포해전'),
                      ),
                    ],
                    ),
                    Row(
                    children: [
                      Icon(Icons.check_circle_outline),
                      Padding(
                        padding: EdgeInsets.fromLTRB(8, 0,0,0),
                        child: Text('당포해전'),
                      ),
                    ],
                    ),
                    Row(
                    children: [
                      Icon(Icons.check_circle_outline),
                      Padding(
                        padding: EdgeInsets.fromLTRB(8, 0,0,0),
                        child: Text('한산도대첩'),
                      ),
                    ],
                    ),
                    Row(
                    children: [
                      Icon(Icons.check_circle_outline),
                      Padding(
                        padding: EdgeInsets.fromLTRB(8, 0,0,0),
                        child: Text('부산포해전'),
                      ),
                    ],
                    ),
                    Row(
                    children: [
                      Icon(Icons.check_circle_outline),
                     Padding(
                        padding: EdgeInsets.fromLTRB(8, 0,0,0),
                        child: Text('명량해전'),
                      ),
                    ],
                    ),
                    Row(
                    children: [
                      Icon(Icons.check_circle_outline),
                      Padding(
                        padding: EdgeInsets.fromLTRB(8, 0,0,0),
                        child: Text('노량해전'),
                      ),
                    ],
                    ),
                ],
              ),
              Row(
                mainAxisAlignment:MainAxisAlignment.center ,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(
                      'images/ship.gif'
                    ),
                    radius: 40,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}