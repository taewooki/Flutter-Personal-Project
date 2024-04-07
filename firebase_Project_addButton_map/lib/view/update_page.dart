import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UpdatePage extends StatefulWidget {
  const UpdatePage({super.key});

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  var value = Get.arguments ?? "__";

  late TextEditingController nameController;
  late TextEditingController phoneController;
  late TextEditingController estimateController;
  XFile? imageFile;
  File? imgFile;
  final ImagePicker picker = ImagePicker();

  late TextEditingController latController;
  late TextEditingController lngController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    phoneController = TextEditingController();
    estimateController = TextEditingController();
    latController = TextEditingController();
    lngController = TextEditingController();

    nameController.text = value[1];
    phoneController.text = value[2];
    estimateController.text = value[3];
    print(value[4]);
    latController.text = value[5];
    lngController.text = value[6];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('맛집 수정'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
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
                        ? Image.network(value[4])
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
                  labelText: '상호',
                ),
              ),
              TextField(
                controller: phoneController,
                decoration: const InputDecoration(
                  labelText: '전화',
                ),
              ),
              TextField(
                controller: estimateController,
                decoration: const InputDecoration(
                  labelText: '평가',
                ),
              ),
              ElevatedButton(
                  onPressed: () => updateAction(), child: const Text('수정'))
            ],
          ),
        ),
      ),
    );
  }

  updateAction() async {
    String name = nameController.text;
    String phone = phoneController.text;
    String estimate = estimateController.text;
    String lat = latController.text;
    String lng = lngController.text;

    String image = '';

    if (imageFile != null) {
      image = await preparingImage();
    } else {
      image = value[4];
    }

    FirebaseFirestore.instance.collection('stores').doc(value[0]).update({
      'name': name,
      'phone': phone,
      'estimate': estimate,
      'image': image,
      'lat': lat,
      'lng': lng,
    });

    Get.back();
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

    await firebaseStorage.delete();
    await firebaseStorage.putFile(imgFile!);

    String downloadURL = await firebaseStorage.getDownloadURL();
    return downloadURL;
  }
}
