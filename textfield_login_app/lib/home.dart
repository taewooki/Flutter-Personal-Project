import 'package:flutter/material.dart';
import 'package:textfield_login_app/view/second_page.dart';
class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}
class _HomeState extends State<Home> {
  // Property
  late TextEditingController idController;
  late TextEditingController pwController;
  @override
  void initState() {
    super.initState();
    idController = TextEditingController();
    pwController = TextEditingController();
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Log In'),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(40.0),
                  child: CircleAvatar(
                    backgroundImage: AssetImage(
                      'images/user.png',
                    ),
                    radius: 90,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextField(
                    controller: idController,
                    decoration: const InputDecoration(
                      label: Text('사용자 ID를 입력하세요.')
                    ),
                    keyboardType: TextInputType.text,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextField(
                    controller: pwController,
                    decoration: const InputDecoration(
                      label: Text('사용자 패스워드를 입력하세요.')
                    ),
                    keyboardType: TextInputType.text,
                    obscureText: true,
                  ),
                ),
                ElevatedButton(
                  onPressed: () => checkIdPassword(),
                  child: const Text('Log In')
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  // -- Functions
  checkIdPassword() {
    // 3개의 경우가 존재함
    if(idController.text.trim().isEmpty || pwController.text.trim().isEmpty) {
      // ID or PW가 비어있는 경우,
      errorSnackBar();
    }
    else {
      if(idController.text.trim() == 'root' && pwController.text.trim() == 'qwer1234') {
        // 정상적인 로그인일 경우,
        _showDialog();
      }
      else {
        // ID or PW가 올바르지 않은경우,
        warnSnackBar();
      }
    }
  }
  errorSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('사용자 ID와 패스워드를 입력하세요.'),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
      )
    );
  }
  _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext buildContext) {
        return AlertDialog(
          title: const Text('환영합니다'),
          content: const Text('로그인 되었습니다.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(buildContext).pop();
                // 1번 방식
                // Navigator.pushNamed(context, '/second');
                // 2번 방식
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return const SecondPage();
                  },)
                );
              },
              child: const Text('OK')
            )
          ],
        );
      },
    );
  }
  warnSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('사용자 ID 또는 패스워드가 일치하지 않습니다.'),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.orange,
      )
    );
  }
} // End