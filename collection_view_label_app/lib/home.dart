import 'package:flutter/material.dart';

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
      "유비",
      "관우",
      "장비",
      "조조",
      "여포",
      "초선",
      "손건",
      "장양",
      "손책",      
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
            onPressed: (){
              //
            }, 
            icon: const Icon(Icons.edit),
          ),
        ],

      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: heroList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            ), 
          itemBuilder:(context, index) {
            return Container(
              height: 50,
              color: Colors.grey,
              child: Card(
                color: Colors.yellow,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(heroList[index])         
              
                  ],
                ),
              ),
            );
          },
          ),
      ),
    );
  }
}