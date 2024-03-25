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
  late TextEditingController addCont;
  late TextEditingController subCont;
  late TextEditingController mulCont;
  late TextEditingController divCont;

  @override
  void initState() {    
    super.initState();
    num1Controller = TextEditingController();
    num2Controller = TextEditingController();
    addCont = TextEditingController();
    subCont = TextEditingController();
    mulCont = TextEditingController();
    divCont = TextEditingController();
  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('간단한 계산기'),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
            children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(controller : num1Controller,
                    decoration: InputDecoration(
                    label: Text('첫번째 숫자를 입력하세요.'),
                      border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),                    
                  ), 
                  keyboardType: TextInputType.number,               
                  ),
                ), 
                TextField(controller: num2Controller,
                  decoration: InputDecoration(
                    label: Text('두번째 숫자를 입력하세요'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                    ),
                      keyboardType: TextInputType.number,
                    ),
                    Row(

                    ),
                
                  
                ],
                                
                )
              
            ),
          ),

        ),
      );
    
  }
}