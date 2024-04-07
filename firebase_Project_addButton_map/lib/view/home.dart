import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_list_app/view/insert_page.dart';
import 'package:firebase_list_app/view/update_page.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import '../model/store.dart';
import 'map_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('내가 경험한 맛집 리스트'),
        actions: [
          IconButton(
              onPressed: () => Get.to(const InsertPage()),
              icon: const Icon(Icons.add))
        ],
      ),
      body: Center(
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('stores')
              .orderBy('name', descending: false)
              .snapshots(),
          builder: (context, snapshot) {
            // snapshot에 데이터가 없다면,
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }
            final documents = snapshot.data!.docs;
            return ListView(
              children: documents.map((e) => _buildItemWidget(e)).toList(),
            );
          },
        ),
      ),
    );
  }

  // -- Functions

  Widget _buildItemWidget(doc) {
    final store = Store(
        name: doc['name'],
        phone: doc['phone'],
        estimate: doc['estimate'],
        image: doc['image'],
        lat: doc['lat'],
        lng: doc['lng']);

    return Column(
      children: [
        Dismissible(
          direction: DismissDirection.horizontal,
          background: Container(
            color: Colors.green,
            alignment: Alignment.centerLeft,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.edit,
                  color: Colors.white,
                ),
                SizedBox(height: 3),
                Text(
                  '수정',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          secondaryBackground: Container(
            color: Colors.red,
            alignment: Alignment.centerRight,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.delete_forever,
                  color: Colors.white,
                ),
                SizedBox(height: 3),
                Text(
                  '삭제',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          key: ValueKey(doc),
          onDismissed: (direction) async {
            if (direction == DismissDirection.endToStart) {
              // Delete Query
              FirebaseFirestore.instance
                  .collection('stores')
                  .doc(doc.id)
                  .delete();
              await deleteImage(store.name);
            } else if (direction == DismissDirection.startToEnd) {
              // edit query
              Get.to(const UpdatePage(), arguments: [
                doc.id,
                doc['name'],
                doc['phone'],
                doc['estimate'],
                doc['image'],
                doc['lat'],
                doc['lng'],
              ]);
              setState(() {});
            }
          },
          child: GestureDetector(
            onTap: () => Get.to(MapPage(), arguments: [
              doc['name'],
              double.parse(doc['lat'].toString()), // double 타입 사용
              double.parse(doc['lng'].toString()), // double 타입 사용
            ]),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
              child: Card(
                color: Theme.of(context).colorScheme.tertiaryContainer,
                child: ListTile(
                  title: Row(
                    children: [
                      store.image == null
                          ? const Text('이미지가 없습니다')
                          : Padding(
                              padding: const EdgeInsets.fromLTRB(0, 3, 15, 3),
                              child: Image.network(
                                store.image!,
                                width: 100,
                              ),
                            ),
                      Text(
                        '명칭 : ${store.name}\n전화번호 : ${store.phone}',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  deleteImage(String name) async {
    final firebaseStorage =
        FirebaseStorage.instance.ref().child('images').child('$name.png');
    await firebaseStorage.delete();
  }
}
