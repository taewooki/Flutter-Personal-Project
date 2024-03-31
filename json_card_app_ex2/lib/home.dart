import 'dart:convert';

import 'package:flutter/material.dart'; // Flutter UI 구성 요소를 사용하기 위해.
import 'package:http/http.dart' as http; // HTTP 요청을 보내기 위해 사용.

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
    news = []; // 뉴스 목록 만듬.
    getJSONData(); // 메서드 호출 데이터 가져옴.
  }
  // async/awit를 사용하여 비동기적으로 HTTP GET 요청을 보내고 해당 응답을 JSON 형식으로
  // 디토딩하여 리스트에 추가.

  getJSONData() async {
    var url = Uri.parse('https://zeushahn.github.io/Test/cards.json');
    var response = await http.get(url); // 해당서버에서 JSON 데이터 가져옴.
    // print(response.body); 데이터를 확인.
    var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
    List result = dataConvertedJSON['results'];
    news.addAll(result);
    setState(() {}); // UI를 업데이트.
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
                // 뉴스 카드 목록을 표시.
                itemCount: news.length,
                itemBuilder: (context, index) => cardBuild(context, index),
              ),
      ),
    );
  }
  // widdet functions

  Widget cardBuild(BuildContext context, int index) {
    return Card(
      // 카드를 사용하여 뉴스 가드를 만듬.
      color: const Color.fromARGB(255, 57, 54, 54),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Image.network(news[index]['image'].toString()),
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
                      style: const TextStyle(
                          color: Colors.white,
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