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
    data = [];
    getJSONData();
  }

  getJSONData() async {
    var url = Uri.parse('https://zeushahn.github.io/Test/student.json');
    var response = await http.get(url);
    // print(response.body);
    var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
    List result = dataConvertedJSON['results'];
    data.addAll(result);
    setState(() {});
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
            '데이터 불러오는중',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          )
          : ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) => cardBuild(context, index)
            ),
      ),
    );
  }

  // -- Functions --
  Widget cardBuild(BuildContext context, index) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
      child: Column(
        children: [
          SizedBox(
            width: 300,
            child: Card(
              color: Colors.yellow,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 0 ,0, 0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Text(
                          'Code : ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        Text(
                          data[index]['code'].toString()
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          'Name : ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        Text(
                          data[index]['name'].toString()
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          'Dept : ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        Text(
                          data[index]['dept'].toString()
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          'Phone : ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        Text(
                          data[index]['phone'].toString()
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

} // End