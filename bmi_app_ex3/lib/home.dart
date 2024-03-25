
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  // Property
  late TextEditingController num1Cont;
  late TextEditingController num2Cont;
  late String bmi;
  late String result;

  @override
  void initState() {   
    super.initState();
    num1Cont = TextEditingController();
    num2Cont = TextEditingController();
    bmi = "";
    result ="";

  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('BMI 계산기'),
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
                  child: TextField(
                    controller: num1Cont,
                    decoration: InputDecoration(
                      label: const Text('신장을 입력하세요(단위: cm)'),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: num2Cont,
                      decoration: const InputDecoration(
                        label: Text('몸무게를 입력하세요(단위: kg)'),
                        border: OutlineInputBorder()
                        ),
                        keyboardType: TextInputType.text,
                      ),
                  ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () => calcInput(),
                            style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            ),
                            child: const Text('계산하기'),
                          ),
                          Text('귀하의  BMI 지수는 $bmi'),
                        ],
                      ),
                    ), 
                  
              ],
            ),
          ),
        ),
      ),
    );
  }
  // -----Functions----------
  calcInput(){
    if(num1Cont.text.trim().isNotEmpty &&
    num2Cont.text.trim().isNotEmpty ) {
      int num1 = int.parse(num1Cont.text);
      int num2 = int.parse(num2Cont.text);

      double bmi = double.parse((num2/(num1 * num1)).toStringAsFixed(1));
      

    }else{
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('숫자를 입력하세요.'),
          duration: Duration(seconds: 1),
          backgroundColor: Colors.red,
        ),
      );
    }

  }



}// End