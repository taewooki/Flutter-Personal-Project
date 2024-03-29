import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  late List news;

  @override
  void initState() {    
    super.initState();
    news = [];
    getJSONData();
  }

  getJSONData() async{
    var url = Uri.parse('https://zeushahn.github.io/Test/cards.json');
    var response = await http.get(url);
    // print(response.body);
    var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
    List result = dataConvertedJSON['results'];
    news.addAll(result);
    setState(() {});
    
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown,
      appBar: AppBar(
        title: const Text('News'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: news.isEmpty
        ? const CircularProgressIndicator()
        : ListView.builder(
          itemCount: news.length,
          itemBuilder:(context, index) => cardBuild(context,index),
          ),
      ),
    );
  }
  // widdet functions


  Widget cardBuild(BuildContext context, int index){
    return Card(
      color: const Color.fromARGB(255, 57, 54, 54),      
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(                  
          children: [            
            Image.network(
              news[index]['image'].toString()
            ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            
            child: Row(              
                children: [                  
                  Text(
                    news[index]['category'].toString(),
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
          ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                children: [
                  SizedBox(
                    width: 350, // 글자 수 줄이기.
                    child: Text(
                      news[index]['heading'].toString(),
                      style: const TextStyle(color: Colors.white,
                      fontSize: 19,
                      fontWeight: FontWeight.bold),
                      
                    ),
                  ),
                ],
                            ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),                
                child: Row(                  
                children: [
                  Text(
                    news[index]['author'].toString(),
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
                            ),
              ),   
          ],
        ),
      ),
    );
  }


}// end