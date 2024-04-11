import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/route_manager.dart';
import 'package:http/http.dart' as http;

import 'delete.dart';
import 'insert.dart';
import 'update.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List stores;

  @override
  void initState() {
    super.initState();
    stores = [];
    getJSPData();
  }

  getJSPData() async {
    var url =
        Uri.parse('http://localhost:8080/Flutter/JSP/store_query_flutter.jsp');
    var response = await http.readBytes(url);
    List result = json.decode(utf8.decode(response))['results'];
    stores.addAll(result);
    setState(() {});
  }

  reloadData() {
    stores.clear();
    getJSPData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('유명한 맛집'),
        actions: [
          IconButton(
              onPressed: () {
                Get.to(const InsertPage())!.then(
                  (value) => reloadData(),
                );
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
          itemCount: stores.length,
          itemBuilder: (context, index) {
            return Slidable(
              endActionPane:
                  ActionPane(motion: const DrawerMotion(), children: [
                SlidableAction(
                  onPressed: (context) =>
                      sendDeleteJSP(index).then((value) => reloadData()),
                  icon: Icons.delete,
                  backgroundColor: Colors.red,
                  borderRadius: BorderRadius.circular(20),
                )
              ]),
              child: GestureDetector(
                onTap: () =>
                    Get.to(const UpdatePage(), arguments: stores[index])!
                        .then((value) => reloadData()),
                onLongPress: () =>
                    Get.to(const DeletePage(), arguments: stores[index])!
                        .then((value) => reloadData()),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Card(
                    color: index % 2 == 0
                        ? Theme.of(context).colorScheme.primaryContainer
                        : Theme.of(context).colorScheme.tertiaryContainer,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Row(
                              children: [
                                const SizedBox(
                                  width: 80,
                                  child: Text(
                                    '상호 : ',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Text(
                                  stores[index]['stname'],
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Row(
                              children: [
                                const SizedBox(
                                  width: 80,
                                  child: Text(
                                    '전화 : ',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Text(
                                  stores[index]['stphone'],
                                )
                              ],
                            ),
                          ),
                          // Padding(
                          //   padding: const EdgeInsets.all(3.0),
                          //   child: Row(
                          //     children: [
                          //       const SizedBox(
                          //         width: 80,
                          //         // height: 20,
                          //         child: Text(
                          //           'Address : ',
                          //           style:
                          //               TextStyle(fontWeight: FontWeight.bold),
                          //         ),
                          //       ),
                          //       Text(
                          //         students[index]['address'],
                          //       )
                          //     ],
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  sendDeleteJSP(index) async {
    String id = stores[index]['id'];

    var url =
        Uri.parse('http://localhost:8080/Flutter/JSP/delete_store.jsp?id=$id');
    var response = await http.get(url);
    var convert = json.decode(utf8.decode(response.bodyBytes));

    var result = convert['result'];
    result == 'OK' ? _showDialog() : _errorSnackBar();
  }

  _showDialog() {
    Get.defaultDialog(
        title: '성공',
        middleText: '삭제가 완료되었습니다.',
        barrierDismissible: false,
        actions: [
          TextButton(
              onPressed: () {
                Get.back();
              },
              child: const Text('확인'))
        ]);
  }

  _errorSnackBar() {
    Get.snackbar('실패', '삭제에 실패하였습니다. 다시 시도하세요.',
        backgroundColor: Colors.red, colorText: Colors.white);
  }
}
