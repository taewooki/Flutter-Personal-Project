import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List movie;

  @override
  void initState() {
    super.initState();
    movie = [];
    addJsonData();
  }

  addJsonData() async {
    var url = Uri.parse('https://zeushahn.github.io/Test/movies.json');
    var response = await http.readBytes(url);
    List result = json.decode(utf8.decode(response))['results'];
    movie.addAll(result);
    // setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('JSON Movie'),
      ),
      body: Center(
        child: movie.isEmpty
          ? const CircularProgressIndicator()
          : ListView.builder(
              itemCount: movie.length,
              itemBuilder: (context, index) => buildCard(context, index),
            ),
      )
    );
  }

  Widget buildCard(context, index) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Card(
        color: Colors.cyanAccent,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Image.network(
                movie[index]['image'],
                width: 100,
              ),
            ),
            Text(
              movie[index]['title'],
              style: const TextStyle(
                fontWeight: FontWeight.bold
              ),
            )
          ],
        ),
      ),
    );
  }
}