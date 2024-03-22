import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  late int count;

  @override
  void initState() {
    super.initState();
    count = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Count Up'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '현재 클릭수는 $count 입니다.',
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold
              ),
            ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     count++;
      //     setState(() {});
      //   },
      //   backgroundColor: Colors.red,
      //   foregroundColor: Colors.white,
      //   shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.circular(100),
      //   ),
      //   child: const Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       Icon(
      //         Icons.add
      //       ),
      //       Text(
      //         '추가',
      //         style: TextStyle(
      //           fontSize: 20
      //         ),
      //       )
      //     ],
      //   ),
      // ),
      floatingActionButton: ElevatedButton(
        onPressed: () => {
          count++,
          setState(() {})
        },
        child: const Text('더하기')
      ),
    );
  }
}