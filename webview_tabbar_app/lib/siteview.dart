import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebView extends StatefulWidget {
  final String siteName;

  const WebView(
    {
      super.key,
      required this.siteName,
    }
  );

  @override
  State<WebView> createState() => _WebViewState();
}

class _WebViewState extends State<WebView> {

  late WebViewController controller;
  late bool isLoading;

  @override
  void initState() {
    super.initState();
    isLoading = true;

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
      ..loadRequest(Uri.parse("https://${widget.siteName}"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          isLoading
          ? const Center(
            child: CircularProgressIndicator(),
          )
          : Stack(),
          WebViewWidget(controller: controller)
        ]
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => backProcess(),
      ),
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

  snackBarFunction() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('No more to go!'),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
      )
    );
  }

  reloadSite() {
    controller.loadRequest(Uri.parse("https://${widget.siteName}"));
  }

}