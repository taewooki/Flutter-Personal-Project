import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:image_picker/image_picker.dart';

class InsertPage extends StatefulWidget {
  const InsertPage({super.key});

  @override
  State<InsertPage> createState() => _InsertPageState();
}

class _InsertPageState extends State<InsertPage> {
  late TextEditingController nameController;
  late TextEditingController phoneController;
  late TextEditingController estimateController;
  late bool _isloading;

  late TextEditingController latController;
  late TextEditingController lngController;

  XFile? imageFile;
  final ImagePicker picker = ImagePicker();
  File? imgFile;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    phoneController = TextEditingController();
    estimateController = TextEditingController();
    latController = TextEditingController();
    lngController = TextEditingController();

    _isloading = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _isloading ? Colors.grey.withOpacity(1) : Colors.white,
      appBar: AppBar(
        title: const Text('맛집 추가'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () => getImageFromDevice(ImageSource.gallery),
                      child: const Text('Image')),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 200,
                      color: Colors.grey,
                      child: Center(
                        child: imageFile == null
                            ? const Text('Image is not seelected')
                            : Image.file(File(imageFile!.path)),
                      ),
                    ),
                  ),
                  TextField(
                    controller: latController,
                    decoration: const InputDecoration(
                      labelText: '위도',
                    ),
                  ),
                  TextField(
                    controller: lngController,
                    decoration: const InputDecoration(
                      labelText: '경도',
                    ),
                  ),
                  TextField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      labelText: '상호를 입력해주세요',
                    ),
                  ),
                  TextField(
                    controller: phoneController,
                    decoration: const InputDecoration(
                      labelText: '전화번호를 입력해주세요',
                    ),
                  ),
                  TextField(
                    controller: estimateController,
                    decoration: const InputDecoration(
                      labelText: '평가를 남겨주세요',
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () => _insertAction(), child: const Text('입력'))
                ],
              ),
              _isloading
                  ? Center(
                      child: CircularProgressIndicator(
                      valueColor:
                          const AlwaysStoppedAnimation<Color>(Colors.blue),
                      backgroundColor: Colors.grey.withOpacity(1),
                    ))
                  : const Text(''),
            ],
          ),
        ),
      ),
    );
  }

  _insertAction() async {
    setState(() {
      _isloading = true;
    });
    String name = nameController.text;
    String phone = phoneController.text;
    String estimate = estimateController.text;
    String image = await preparingImage();
    String lat = latController.text;
    String lng = lngController.text;

    FirebaseFirestore.instance.collection('stores').add({
      'name': name,
      'phone': phone,
      'estimate': estimate,
      'image': image,
      'lat': lat,
      'lng': lng
    });

    setState(() {
      _isloading = false;
    });

    showAlert();
  }

  getImageFromDevice(imageSource) async {
    final XFile? pickedFile = await picker.pickImage(source: imageSource);
    if (pickedFile == null) {
      imageFile = null;
    } else {
      // 선택한 이미지의 경로를 XFile로 변환 => XFile의 경로를 File로 변환
      imageFile = XFile(pickedFile.path);
      imgFile = File(imageFile!.path);
    }
    setState(() {});
  }

  Future<String> preparingImage() async {
    final firebaseStorage = FirebaseStorage.instance
        .ref()
        .child('images')
        .child('${nameController.text}.png');

    await firebaseStorage.putFile(imgFile!);
    String downloadURL = await firebaseStorage.getDownloadURL();
    return downloadURL;
  }

  showAlert() {
    Get.defaultDialog(title: '성공', middleText: '입력에 성공하였습니다.', actions: [
      TextButton(
          onPressed: () {
            Get.back();
            Get.back();
          },
          child: const Text('확인'))
    ]);
  }
}
