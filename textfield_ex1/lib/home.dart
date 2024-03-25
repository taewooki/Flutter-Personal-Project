
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
    // calcResult = TextEditingController();
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
            padding: const EdgeInsets.all(15.0),
            child: Column(
            children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: num1Controller,
                decoration: InputDecoration(
                label: const Text('첫번째 숫자를 입력하세요.'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20)),                  
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            //----------------             
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: num2Controller,
                decoration: const InputDecoration(
                  label: Text('두번째 숫자를 입력하세요'),
                  border: OutlineInputBorder()
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            //----------------
          
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
              
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                Padding(
                  padding: const EdgeInsets.all(10.0),
                child:ElevatedButton(
                onPressed: () => calcInput(),
                style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)
                ),                
              ), 
              child: const Text('계산하기'),
              ),  
          ),
              Padding(
                  padding: const EdgeInsets.all(10.0),
                child:ElevatedButton(
                  onPressed: () => deleteInput(),
                  style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)
                ),               
              ), 
              child: const Text('지우기'),
              ),  
            ),
          ],
        ),
        ),

          // ------ 계산 결과----
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
            readOnly: true,
            controller: addCont,
            decoration: InputDecoration(
              label: const Text('덧셈 결과'),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20)),
              ),
            ),
          ),

                  Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
            readOnly: true,
            controller: subCont,
            decoration: InputDecoration(
              label: const Text('뺄셈 결과'),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20)),
              ),
            ),
          ),

                  Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
            readOnly: true,
            controller: mulCont,
            decoration: InputDecoration(
              label: const Text('곱셈 결과'),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20)),
              ),
            ),
          ),

                  Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
            readOnly: true,
            controller: divCont,
            decoration: InputDecoration(
              label: const Text('나눗셈 결과'),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20)),
              ),
            ),
          ),
          ],
          ),
        ),        
        ),
        ),
      );    
  }

  // ---- Functions -----
  calcInput(){
    // textfield에 data가 있을 경우와 없을 경우
    if(num1Controller.text.trim().isNotEmpty && 
    num2Controller.text.trim().isNotEmpty) {     
      int num1 = int.parse(num1Controller.text);
      int num2 = int.parse(num2Controller.text);

      addCont.text = (num1 + num2).toString();
      subCont.text = (num1 - num2).toString();
      mulCont.text = (num1 * num2).toString();
      divCont.text = (num1 / num2).isInfinite ? '0으로 나눌 수 있습니다.' : (num1/num2).toString();
      //int sum = num1 + num2;
      // calcResult = Text('합계는 $sum 입니다.') as TextEditingController; 

    }else{
      // Error
  //     errorSnackBar();
  //   }
  // }
  //   errorSnackBar(){
      

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('숫자를 입력하세요.'),
        duration: Duration(seconds: 1),
        backgroundColor: Colors.red,
      ),
      );
  }
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
  deleteInput(){
    num1Controller.text ='';
    num2Controller.text ='';
    addCont.text ='';
    subCont.text ='';
    mulCont.text ='';
    divCont.text ='';
    FocusScope.of(context).unfocus();
  } 
  

} //End