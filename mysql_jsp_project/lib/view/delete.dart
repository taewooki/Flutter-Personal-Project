import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class DeletePage extends StatefulWidget {
  const DeletePage({super.key});

  @override
  State<DeletePage> createState() => _DeletePageState();
}

class _DeletePageState extends State<DeletePage> {
  var request = Get.arguments;

  late TextEditingController idController;
  late TextEditingController stnameController;
  late TextEditingController stphoneController;
  late TextEditingController estimateController;

  @override
  void initState() {
    super.initState();
    idController = TextEditingController();
    stnameController = TextEditingController();
    stphoneController = TextEditingController();
    estimateController = TextEditingController();

    idController.text = request['id'];
    stnameController.text = request['stname'];
    stphoneController.text = request['stphone'];
    estimateController.text = request['estimate'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('맛집 삭제'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: stnameController,
                decoration: const InputDecoration(label: Text('상호를 입력하세요.')),
                readOnly: true,
              ),
              TextField(
                controller: stphoneController,
                decoration: const InputDecoration(label: Text('전화를 입력하세요.')),
                readOnly: true,
              ),
              TextField(
                controller: estimateController,
                decoration: const InputDecoration(label: Text('평가를 해주세요.')),
                readOnly: true,
              ),
              ElevatedButton(
                  onPressed: () async {
                    sendJSP();
                  },
                  child: const Text('삭제'))
            ],
          ),
        ),
      ),
    );
  }

  //

  sendJSP() async {
    String id = idController.text;

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
