import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/route_manager.dart';

import '../vm/database_handler.dart';
import 'insert_store.dart';
import 'map_page.dart';
import 'update_store.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  late DatabaseHandler handler;

  @override
  void initState() {
    super.initState();
    handler = DatabaseHandler();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('나의 맛집 (SQLite)'),
        actions: [
          IconButton(
            onPressed: () => Get.to(() => const InsertStore())!
                .then((value) => reloadData()),
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: FutureBuilder(
        future: handler.queryStores(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(10, 5, 10, 3),
                  child: GestureDetector(
                    onTap: () => Get.to(const MapPage(), arguments: [
                      snapshot.data![index].name,
                      snapshot.data![index].lat,
                      snapshot.data![index].lng,
                    ]),
                    child: Slidable(
                      endActionPane:
                          ActionPane(motion: const DrawerMotion(), children: [
                        SlidableAction(
                          icon: Icons.delete,
                          backgroundColor: Colors.red,
                          onPressed: (context) {
                            handler.deleteStores(snapshot.data![index].name);
                            reloadData();
                          },
                        ),
                        SlidableAction(
                          icon: Icons.edit,
                          backgroundColor: Colors.green,
                          onPressed: (context) {
                            Get.to(const UpdateStore(), arguments: [
                              snapshot.data![index].name,
                              snapshot.data![index].phone,
                              snapshot.data![index].estimate,
                              snapshot.data![index].lat,
                              snapshot.data![index].lng,
                              snapshot.data![index].image,
                            ])!
                                .then((value) => reloadData());
                          },
                        ),
                      ]),
                      child: Card(
                        color: index % 2 == 0
                            ? Theme.of(context).colorScheme.primaryContainer
                            : Theme.of(context).colorScheme.tertiaryContainer,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            children: [
                              Image.memory(
                                snapshot.data![index].image,
                                width: 100,
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        const Text(
                                          '상호 : ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(snapshot.data![index].name)
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const Text(
                                          '전화번호 : ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(snapshot.data![index].phone)
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  reloadData() {
    handler.queryStores();
    setState(() {});
  }
}
