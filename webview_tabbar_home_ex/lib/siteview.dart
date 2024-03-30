import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebView extends StatefulWidget {
  final String siteName; //변수 설정.
  
  //StatefulWidget 상속 받음. 웹 뷰 화면의 기본 구조와 기능을 정의.
  //siteName 과 같은 속성을 통해 초기 설정을 수행.

  const WebView({super.key, required this.siteName // this로 지정.
      });

  @override
  State<WebView> createState() => _WebViewState(); // WebView 위젯의 상태를 관리.
} // UI 구축,데이터로딩,사용자 상호처리 등을 담당.
// isLoading과 같은 변수와 build 메서드를 통해 동작을 정의.

class _WebViewState extends State<WebView> {
  late WebViewController controller;
  late bool isLoading; // 웹 뷰가 콘텐츠를 로딩하는지 여부를 나타내는 플래그.

  @override
  void initState() {
    // StatefulWidget이 생성될 때 호출. 웹뷰 컨들롤러를 초기화하고, 페이지 로딩
    super.initState(); // 상태를 관리하기 위한 콜백 함수를 설정.
    isLoading = true; // 초기화.

    controller = WebViewController() // 인스턴스 생성.
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(NavigationDelegate(
        onProgress: (progress) {
          isLoading = true;
          setState(() {});
        },
        onPageStarted: (url) {
          isLoading = true;
          setState(() {});
        },
        onPageFinished: (url) {
          isLoading = false;
          setState(() {});
        },
        onWebResourceError: (error) {
          isLoading = false;
          setState(() {});
        },
      ))
      ..loadRequest(Uri.parse("https://${widget.siteName}"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Stack(),
        WebViewWidget(controller: controller)
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () => backProcess(),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        child: Icon(Icons.arrow_back),
        shape: CircleBorder(),
      ),
    );
  }

  //functions
  backProcess() async {
    if (await controller.canGoBack()) {
      controller.goBack();
    } else {
      snackBarFunction();
    }
  }

  snackBarFunction() {
    // 더 이상 뒤로 갈 수 없을 때 호출되고 사용자에게 메시지를 표시.
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('No more to go!'),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.blue,
    ));
  }
} // end
