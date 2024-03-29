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
    var url = Uri.parse('https://zeushahn.github.io/Test/movies.json');
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
        title: const Text('JSON Move'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: data.isEmpty
        ? CircularProgressIndicator()
        : ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) => cardBuild(context, index),
          ),
      ),
    );
  }
  // -----widdet functions-----
  Widget cardBuild(BuildContext context, int indx){
    return Card(
      child: Column(
        children: [
          Row(
            children: [
              Image.network(
                data[indx]['image'].toString()
                ),
            ]
          ),
          Row(
            children: [
              Text(
                data[indx]['title'].toString()
                ),
            ]
          ),
        ],
      ),
    );
  }

}// end