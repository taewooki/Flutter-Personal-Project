import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:image_picker/image_picker.dart';

import '../model/store.dart';
import '../vm/database_handler.dart';

class UpdateStore extends StatefulWidget {
  const UpdateStore({super.key});

  @override
  State<UpdateStore> createState() => _UpdateStoreState();
}

class _UpdateStoreState extends State<UpdateStore> {
  late DatabaseHandler handler;
  late String name;
  late String phone;
  late String estimate;
  late String lat;
  late String lng;
  late Uint8List originalUnitList;

  late TextEditingController nameController;
  late TextEditingController phoneController;
  late TextEditingController estimateController;
  late TextEditingController latController;
  late TextEditingController lngController;

  final ImagePicker picker = ImagePicker();
  XFile? imageFile;

  var value = Get.arguments ?? '__';

  @override
  void initState() {
    super.initState();
    handler = DatabaseHandler();

    nameController = TextEditingController();
    phoneController = TextEditingController();
    estimateController = TextEditingController();
    latController = TextEditingController();
    lngController = TextEditingController();

    name = '';
    phone = '';
    estimate = '';
    lat = '';
    lng = '';

    nameController.text = value[0];
    phoneController.text = value[1];
    estimateController.text = value[2];
    latController.text = value[3];
    lngController.text = value[4];
    originalUnitList = value[5];
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('나의 맛집 수정'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('상호 :'),
                    SizedBox(
                      width: 250,
                      child: TextField(
                        controller: nameController,
                        keyboardType: TextInputType.text,
                        decoration:
                            const InputDecoration(labelText: '상호를 입력하세요.'),
                        readOnly: T,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('전화 :'),
                    SizedBox(
                      width: 250,
                      child: TextField(
                        controller: phoneController,
                        decoration:
                            const InputDecoration(labelText: '번호를 입력하세요.'),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('평가 :'),
                    SizedBox(
                      width: 250,
                      child: TextField(
                        controller: estimateController,
                        decoration:
                            const InputDecoration(labelText: '평가글을 입력하세요.'),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('위도 :'),
                    SizedBox(
                      width: 250,
                      child: TextField(
                        controller: latController,
                        decoration: const InputDecoration(labelText: '위도'),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('경도 :'),
                    SizedBox(
                      width: 250,
                      child: TextField(
                        controller: lngController,
                        decoration: const InputDecoration(labelText: '경도'),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 200,
                color: Colors.grey,
                child: Center(
                  child: originalUnitList == null
                      ? const Text('Image is not selected')
                      : imageFile != null
                          ? Image.file(File(imageFile!.path))
                          : Image.memory(originalUnitList),
                  // : Text('data'),
                ),
              ),
              ElevatedButton(
                  onPressed: () async =>
                      getImageFromGallery(ImageSource.gallery),
                  child: const Text('Image')),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ElevatedButton(
                        onPressed: () => updateAction(),
                        child: const Text('수정')),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ElevatedButton(
                        onPressed: () async {
                          name = nameController.text;
                          await handler.deleteStores(name);
                          _showDialog2();
                        },
                        child: const Text('삭제')),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  updateAction() async {
    name = nameController.text.toString();
    phone = phoneController.text.toString();
    estimate = estimateController.text.toString();
    lat = latController.text.toString();
    lng = lngController.text.toString();

    if (imageFile == null) {
      setState(() {});
    } else {
      // File Type을 Byte Type으로 변환
      File imageFile1 = File(imageFile!.path);
      Uint8List getImage = await imageFile1.readAsBytes();

      var store = Store(
          name: name,
          phone: phone,
          estimate: estimate,
          lat: lat,
          lng: lng,
          image: getImage);
      await handler.updateStores(store);
      _showDialog();
    }
  }

  _showDialog() {
    Get.defaultDialog(
        title: '입력결과',
        middleText: '수정이 완료되었습니다.',
        backgroundColor: Theme.of(context).colorScheme.primary,
        barrierDismissible: F,
        actions: [
          ElevatedButton(
              onPressed: () {
                Get.back();
                Get.back();
              },
              child: const Text('확인'))
        ]);
  }

  getImageFromGallery(ImageSource imageSource) async {
    final XFile? pickedFile = await picker.pickImage(source: imageSource);
    if (pickedFile == null) {
      // return;
    } else {
      imageFile = XFile(pickedFile.path);
      setState(() {});
    }
  }

  _showDialog2() {
    Get.defaultDialog(
        title: '입력결과',
        middleText: '삭제되었습니다.',
        backgroundColor: Theme.of(context).colorScheme.primary,
        barrierDismissible: F,
        actions: [
          ElevatedButton(
              onPressed: () {
                Get.back();
                Get.back();
              },
              child: const Text('확인'))
        ]);
  }
}
