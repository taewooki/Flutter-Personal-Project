import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late WebViewController controller;
  late bool isLoading; // 서버에서 데이터 가져올때까지 돌아가는 것
  late String siteName;

  @override
  void initState() {
    super.initState();
    isLoading = true;
    siteName = "www.daum.net";

    controller = WebViewController() // controller 에 넣을께 많음. 그래서 .. 으로 사용
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
      ..loadRequest(Uri.parse("http://$siteName")); // 자바에서 쓰는 포맷
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WebView'),        
      ),
      body: Stack(
        children: [
          isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : const Stack(), // 책 갈피
          WebViewWidget(controller: controller),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        child: Icon(Icons.arrow_back),
        onPressed: () => backProccess(),
      ),
    );
  }

  // fucntions
  backProccess() async {
    if (await controller.canGoBack()) {
      controller.goBack();
    } else {
      snackBarFunction();
    }
  }

  snackBarFunction() {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('No more to go'),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.black));
  }

  reloadSite() {
    controller.loadRequest((Uri.parse("https://$siteName")));
  }
} // end
