import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  // Property
  late TextEditingController num1Controller;
  late TextEditingController num2Controller;
  late String calcResult;
  


@override
  void initState() {  
    super.initState();
    num1Controller = TextEditingController();
    num2Controller = TextEditingController();
    calcResult = ();
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(        
        appBar: AppBar(
          title: const Text('Single Textfild'),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: num1Controller,
                decoration: const InputDecoration(
                  labelText: '첫번째 숫자를 입력하세요',
                  border: OutlineInputBorder()
                ),
                keyboardType: TextInputType.text,
              ),
            ),
            //----------------
                            
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: num2Controller,
                decoration: const InputDecoration(
                  labelText: '두번째 숫자를 입력하세요',
                  border: OutlineInputBorder()
                ),
                keyboardType: TextInputType.text,
              ),
            ),
            //----------------
          
            ElevatedButton(
              onPressed: () => inputCheck(), 
              child: const Text('출력'),
              ),           
          ],
        ),
      ),
    );
  }

  // ---- Functions -----
  inputCheck(){
    // textfield에 data가 있을 경우와 없을 경우
    if(num1Controller.text.trim().isNotEmpty && 
    num2Controller.text.trim().isNotEmpty) {
      // showSnackBar();
      int num1 = int.parse(num1Controller.text);
      int num2 = int.parse(num1Controller.text);
      int sum = num1 + num2;
      calcResult = Text('합계는 $sum 입니다.') as String; 

    }else{
      // Error
      errorSnackBar();
    }
  }
    errorSnackBar(){

      

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('숫자를 입력하세요.'),
        duration: Duration(seconds: 1),
        backgroundColor: Colors.red,
      ),
      );
  }

  // showSnackBar(){

  //     int num1 = int.parse(num1Controller.text);
  //     int num2 = int.parse(num1Controller.text);
  //     int sum = num1 + num2;
      

  //   ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(
  //       content: Text('합계는 $sum 입니다.'),
  //       duration: const Duration(seconds: 1),
  //       backgroundColor: Colors.blue,
  //     ),
  //     );
  // }  
  

} //End