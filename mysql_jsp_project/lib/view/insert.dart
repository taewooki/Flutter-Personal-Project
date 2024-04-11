import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:http/http.dart' as http;

class InsertPage extends StatefulWidget {
  const InsertPage({super.key});

  @override
  State<InsertPage> createState() => _InsertPageState();
}

class _InsertPageState extends State<InsertPage> {
  late TextEditingController stnameController;
  late TextEditingController stphoneController;
  late TextEditingController estimateController;

  @override
  void initState() {
    super.initState();
    stnameController = TextEditingController();
    stphoneController = TextEditingController();
    estimateController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('맛집 추가'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: stnameController,
                decoration: const InputDecoration(label: Text('이름을 입력하세요.')),
              ),
              TextField(
                controller: stphoneController,
                decoration: const InputDecoration(label: Text('번호를 입력하세요.')),
              ),
              TextField(
                controller: estimateController,
                decoration: const InputDecoration(label: Text('평가를 남겨주세요.')),
              ),
              ElevatedButton(
                  onPressed: () async {
                    sendJSP();
                  },
                  child: const Text('입력'))
            ],
          ),
        ),
      ),
    );
  }

  //

  sendJSP() async {
    String stname = stnameController.text;
    String stphone = stphoneController.text;
    String estimate = estimateController.text;

    var url = Uri.parse(
        'http://localhost:8080/Flutter/JSP/insert_store.jsp?stname=$stname&stphone=$stphone&estimate=$estimate');
    var response = await http.get(url);
    var convert = json.decode(utf8.decode(response.bodyBytes));

    var result = convert['result'];

    result == 'OK' ? _showDialog() : _errorSnackBar();
  }

  _showDialog() {
    Get.defaultDialog(
        title: '성공',
        middleText: '입력이 완료되었습니다.',
        barrierDismissible: false,
        actions: [
          TextButton(
              onPressed: () {
                Get.back();
                Get.back();
              },
              child: const Text('확인'))
        ]);
  }

  _errorSnackBar() {
    Get.snackbar('실패', '입력에 실패하였습니다. 다시 시도하세요.',
        backgroundColor: Colors.red, colorText: Colors.white);
  }
}
