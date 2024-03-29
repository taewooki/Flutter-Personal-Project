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
  late int page;
  late ScrollController _scrollController;
  late TextEditingController textEditingController;

  @override
  void initState() {
    super.initState();
    data = [];
    page = 1;
    textEditingController = TextEditingController();

    _scrollController = ScrollController();
    _scrollController.addListener(() {
      // 리스트의 마지막일 경우
      if(_scrollController.offset >= _scrollController.position.maxScrollExtent &&
        _scrollController.position.outOfRange) {
          page++;
          getJSONData();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        toolbarHeight: 100,
        title: TextField(
          controller : textEditingController,
          decoration: const InputDecoration(
            label: Text('검색어를 입력하세요'),
          ),
        ),
      ),
      body: Center(
        child: data.isEmpty
        ? const Text('데이터가 없습니다.')
        : ListView.builder(
          controller: _scrollController,
          itemCount: data.length,
          itemBuilder: (context, index) {
            return Card(
              child: Row(
                children: [
                  data[index]['thumbnail'].isNotEmpty
                  ? Image.network(
                      data[index]['thumbnail']
                    )
                  : const Text('이미지'),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Text('제목 : '),
                            data[index]['title'].toString().length < 25
                            ? Text(
                                data[index]['title'].toString(),
                              )
                            : Text(
                                data[index]['title'].toString().replaceRange(20, data[index]['title'].toString().length, "..."),
                              )
                          ],
                        ),
                        Row(
                          children: [
                            const Text('작가 : '),
                            data[index]['authors'].toString().length < 25
                            ? Text(
                                data[index]['authors'].toString()
                              )
                            : Text(
                                data[index]['authors'].toString().replaceRange(20, data[index]['authors'].toString().length, "..."),
                              )
                          ],
                        ),
                        Row(
                          children: [
                            const Text('할인 가격 : '),
                            Text(data[index]['price'].toString())
                          ],
                        ),
                        Row(
                          children: [
                            const Text('상태 : '),
                            Text(data[index]['status'].toString())
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          page = 1;
          data.clear();
          getJSONData();
        },
        child: const Icon(Icons.file_download)
      ),
    );
  }

  // -- Functions -- 

  getJSONData() async {
    if(textEditingController.text.trim().isEmpty) {
      setState(() {});
      return;
    }
    var uri = Uri.parse('https://dapi.kakao.com/v3/search/book?target=title&page=$page&query=${textEditingController.text.trim()}');
    var response = await http.get(uri, 
      headers: {"Authorization" : "KakaoAK e95d329eb48953033a1d555122482abb"}
    );
    // print(response.body);
    List result = json.decode(utf8.decode(response.bodyBytes))['documents'];
    data.addAll(result);
    setState(() {});
  }
}