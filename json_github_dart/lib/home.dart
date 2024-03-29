import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  late List data;

  @override
  void initState() {  
    super.initState();
    data =[];
    getJSONData();

  }
  getJSONData() async{
    var url = Uri.parse('https://zeushahn.github.io/Test/student.json'); // 서버에서 끝날 때까지
    var response = await http.get(url);  // 기다리고 있다.
    // print(response.body);
    var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
    List result = dataConvertedJSON['results'];
    data.addAll(result);
    setState(() {}); // 데이터 가져오는작업, 화면 그리리는 작업 두가지 누가 먼저 끝날 줄 모른다.
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('JSON Test'),
      ),
      body: Center(
        child: data.isEmpty
        ? const Text(
          '데이터가 없습니다. ',
          style: TextStyle(
            fontSize: 20,          
          ),
          textAlign: TextAlign.center,
        )
        : ListView.builder(
          itemCount: data.length,
          itemBuilder:(context, index) => cardBuild(context,index),
          ),
      ),
    );
  }
  // functions

  //-----widget functions-----
  Widget cardBuild(BuildContext context, int index){
    return Card(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  'Code:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold
                  ),
                  ),
                  Text(data[index]['code'].toString()
                ),
              ],
            ),
          ),
            Row(
            children: [
              const Text(
                'Name:',
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),
                ),
                Text(data[index]['name'].toString()
              ),               
            ],
                      ),
            Row(
            children: [
              const Text(
                'Dept:',
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),
                ),
                Text(data[index]['dept'].toString()
              ),
            ],
                    ),  
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const Text(
                  'Phone:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold
                  ),
                  ),
                  Text(data[index]['phone'].toString()
                ), 
              ],
            ),
          ), 
        ],
      ),
    );
  }




}// end