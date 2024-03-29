import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  late List data;
  late int page;
  late ScrollController _scrollController;

  @override
  void initState() {   
    super.initState();
    data =[];
    page = 1;
    _scrollController = ScrollController();
    

    _scrollController.addListener(() {
      // 리스트의 마지막일 경우
      if(_scrollController.offset >= _scrollController.position.maxScrollExtent &&
      !_scrollController.position.outOfRange){
        page++;
        getJSONData();
      }
    });
    
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text( 'Kakao Rest API Exercise'),
        backgroundColor: Color.fromARGB(255, 244, 5, 85),
      ),
      body: Center(
        child: data.isEmpty
        ? const CircularProgressIndicator()
        : ListView.builder(
          itemCount: data.length,
          controller: _scrollController,
          itemBuilder: (context,index){
            return Card(
              child: Row(
                children: [
                  Image.network(
                    data[index]['thumbnail'],
                    height: 100,
                    width: 100,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            data[index]['title'].toString().length < 26
                            ? Text(data[index]['title'].toString())
                            : Text(data[index]['title']
                            .toString()
                            .replaceRange(26,
                            data[index]['title'].toString().length,
                            "..."),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(data[index]['authors'].toString(),),
                          ],
                        ),
                        Row(
                          children: [
                            Text(data[index]['price'].toString(),),
                          ],
                        ),
                        Row(
                          children: [
                            Text(data[index]['publisher'].toString(),),
                          ],
                        ),
                      ],
                    )
                ],
              ) ,
            );
          } 
      ),
    ),
    floatingActionButton: FloatingActionButton(
      onPressed:() {
        page = 1;
        data.clear;
        getJSONData();
      },
      child: Icon(Icons.arrow_downward),
    ),
    );
  }
  // Functions
  getJSONData()async{
    var uri = Uri.parse('https://dapi.kakao.com/v3/search/book?target=title&page=$page&query=코로나19');
    var response = await http.get(uri,
    headers: {"Authorization" : "KakaoAK e95d329eb48953033a1d555122482abb"});
    print(response.body);
    var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
    List result = dataConvertedJSON['documents'];
    data.addAll(result);
    setState(() {});
  }


}