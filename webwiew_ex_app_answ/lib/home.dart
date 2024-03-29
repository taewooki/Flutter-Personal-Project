import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  late TextEditingController tecontroller;
  late WebViewController controller;
  late bool isLoading;
  late String siteName;

  @override
  void initState() {
    super.initState();
    isLoading = true;
    siteName = "www.google.com";
    tecontroller = TextEditingController();

    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
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
        )
      )
      ..loadRequest(Uri.parse("https://$siteName"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 130,
        backgroundColor: Colors.amber,
        foregroundColor: Colors.white,
        title: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0,0, 0, 15),
                child: Row(
                  children: [
                    SizedBox(
                      width: 300,
                      child: TextField(
                        controller: tecontroller,
                        decoration: const InputDecoration(
                          label: Text('Site 이름을 입력하세요!')
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        siteName = tecontroller.text.trim();
                        reloadSite();
                      },
                      icon: const Icon(Icons.search)
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      siteName = "www.google.com";
                      reloadSite();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('Google')
                  ),
                  ElevatedButton(
                    onPressed: () {
                      siteName = "www.naver.com";
                      reloadSite();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0)
                      )
                    ),
                    child: const Text('Naver')
                  ),
                  ElevatedButton(
                    onPressed: () {
                      siteName = "www.daum.net";
                      reloadSite();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0)
                      )
                    ),
                    child: const Text('Daum')
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          isLoading
          ? const Center(
            child: CircularProgressIndicator(),
          )
          : const Stack(),
          WebViewWidget(controller: controller),
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: () => backProcess(),
              child: Icon(Icons.arrow_back),
              shape: CircleBorder(),
              backgroundColor: Colors.red,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: FloatingActionButton(
              onPressed: () => refreshProcess(),
                child: Icon(Icons.refresh),
                shape: CircleBorder(),
                backgroundColor: Colors.amber,
            ),
          ),
          FloatingActionButton(
            onPressed: () => nextProcess(),
              child: Icon(Icons.arrow_forward_outlined),
              shape: CircleBorder(),
              backgroundColor: Colors.blue,
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  // -- Functions --
  backProcess() async {
    if(await controller.canGoBack()) {
      controller.goBack();
    }
    else {
      snackBarFunction();
    }
  }

  nextProcess() async {
    if(await controller.canGoForward()) {
      controller.goForward();
    }
    else {
      snackBarFunction();
    }
  }

  refreshProcess() async {
    controller.reload();
  }

  snackBarFunction() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('No more to go!'),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 1),
      )
    );
  }

  reloadSite() {
    controller.loadRequest(Uri.parse("https://$siteName"));
  }

}