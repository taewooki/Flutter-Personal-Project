import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late WebViewController controller;
  late bool isLoading; // 서버에서 데이터 가져올때까지 돌아가는 화면
  late String siteName;

  @override
  void initState() {
    super.initState();
    isLoading = true;
    siteName = "www.naver.com"; // 시작페이지.

    controller =
        WebViewController() //(controller 에 넣을께 많음.)웹피이지를 렌더링하고 상호작용하기 위해 사용.
          ..setJavaScriptMode(JavaScriptMode
              .unrestricted) // JavaScript를 사용하기 위해 설정. JavaScript를 제한 없이 실행.
          ..setNavigationDelegate(NavigationDelegate(
            //네비게이션 이벤트를 처리하기 위해 사용.
            onProgress: (progress) {
              // 페이지로딩 진행 진행률 처리.
              isLoading = true;
              setState(() {});
            },
            onPageStarted: (url) {
              // 페이지 로딩 시작 처리.
              isLoading = true; // 콜백 함수 정의 해당 이벤트 발생시 isLoading 변수를 업데이트함.
              setState(() {}); //화면을 다시 그리도록 setState() 함수를 호출.
            },
            onPageFinished: (url) {
              // 페이지 로딩 완료 처리.
              isLoading = false;
              setState(() {});
            },
            onWebResourceError: (error) {
              // 웹 리소스 로딩 오류 처리.
              isLoading = false;
              setState(() {});
            },
          ))
          ..loadRequest(Uri.parse(
              "http://$siteName")); // (자바에서 쓰는 포맷.) 웹페이지로드 loadRequest()사용.
  } // 웹페이지의 주소는 siteName 변수에 저장된 값을 사용하여 동적으로 생성.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text('WebView-Tabbar')],
          ),
        ),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Stack(
        //Stack 위젯을 사용하여 여러 위젯을 겹쳐서 표시할 수 있다.
        children: [
          isLoading //로딩 중 표시되는 CircularProgressIndicator표시 또는 WebViewWidget표시.
              ? const Center(
                  // isLoading 이 ?(true) 이면 로딩 중임을(CircularProgressIndicator) 표시됨.
                  child: CircularProgressIndicator(),
                )
              : const Stack(), // 책 갈피(isLoading이 ?(false)이면 위잿이 비어있게 만들어 로딩 표시를 보이지 않게함.)
          WebViewWidget(
              controller:
                  controller), // 화면에 웹을 표시하는 위젯. controller로 속성으로 웹뷰 제어.
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            child: const Icon(Icons.arrow_back), //부동적으로 위치하는 작은 버튼.
            onPressed: () => backProcess(),
            backgroundColor: Colors.red,
            foregroundColor: Colors.white, // 뒤로가기 버든 함수를 호출하여 버튼이 클릭되면 실행.
          ),
        ],
      ),
      // centerDocked을 사용 버튼위치를 조정해줌.
    );
  }

  // functions
  backProcess() async {
    if (await controller.canGoBack()) {
      // 이전 페이지로 뒤로 갈 수 있는지 확인. 뒤로 갈수있는 경우.
      controller.goBack(); // true 의 경우 controller.goBack을 호출하여 웹 뷰에서 이전으로 이동.
    } else {
      snackBarFunction(); // 뒤로 갈 수 없는 false 의 경우 함수를 호출하여 스낵바 표시.
    }
  }

  snackBarFunction() {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('No more to go!'),
      backgroundColor: Colors.red,
      duration: Duration(seconds: 2),
    ));
  }
}// end
