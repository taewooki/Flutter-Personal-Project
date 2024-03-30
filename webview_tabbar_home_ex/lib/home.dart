import 'package:flutter/material.dart';

import 'siteview.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  // SingleTickerProviderStateMixin을 믹스인하여 애니메이션을 위한 TickerProvider를 얻음.
  late TabController tabController; //탭 컨드롤러 변수 선언.

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
    // 탭컨들롤러 인스턴스 생성, 댑 개수 3개로 설정, SingleTickerProviderStateMixin
    // 에서 받은 TickerProvider를 전달.
  }

  @override
  void dispose() {
    super.dispose(); //앱이 종료될 때 호출됨.TabController인스턴스를 해제함.
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
        controller: tabController,
        children: [
          // 세개의 위젯을 포함.
          WebView(siteName: "www.naver.com"),
          WebView(siteName: "www.google.com"),
          WebView(siteName: "www.daum.net"),
        ],
      ),
      bottomNavigationBar: TabBar(
        // 앱하단의 탭바.
        controller: tabController,
        tabs: [
          Tab(
            icon: Image.asset(
              'images/naver.png', // 이미지 설정.
              width: 30,
            ),
            child: Text('네이버'), // 텍스트 설정.
          ),
          Tab(
            icon: Image.asset(
              'images/google.png',
              width: 30,
            ),
            child: Text('구글'),
          ),
          Tab(
            icon: Image.asset(
              'images/daum.png',
              width: 30,
            ),
            child: Text('다음'),
          ),
        ],
      ),
    );
  }
}
