import 'package:flutter/material.dart';
import 'package:webview_tabbar_app/siteview.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin{

  late TabController tController;

  @override
  void initState() {
    super.initState();
    tController = TabController(
      length: 3,
      vsync: this
    );
  }

  @override
  void dispose() {
    tController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WebView - Tabbar'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: TabBarView(
        controller: tController,
        children: [
          WebView(siteName: "www.naver.com"),
          WebView(siteName: "www.google.com"),
          WebView(siteName: "www.daum.net"),
        ],
      ),
      bottomNavigationBar: TabBar(
        controller: tController,
        tabs: [
          Tab(
            icon: Image.asset(
              'images/naver.png',
              width: 30,
            ),
            child: const Text('네이버'),
          ),
          Tab(
            icon: Image.asset(
              'images/google.png',
              width: 30,

            ),
            child: const Text('구글'),
          ),
          Tab(
            icon: Image.asset(
              'images/daum.png',
              width: 30,
            ),
            child: const Text('다음'),
          ),
        ]
      ),
    );
  }

}