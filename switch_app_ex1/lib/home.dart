import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  //Property
  late String buttonText;
  late bool state;
  late Color buttonColor;
  late bool switchValue;
  

  @override
  void initState() {    
    super.initState();
    state = false;
    buttonText = 'Hello';
    buttonColor = Colors.blue;
    switchValue = true;   
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: const Text('Change button color & text'),
      ),
      body: Center(            
            
        child:ElevatedButton(
          onPressed:() => changeButtonState(),
          style: ElevatedButton.styleFrom(
            backgroundColor: buttonColor,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
            )
          ),
          child: Text(buttonText),          
        ),
          child: Switch(
         value: switchValue,
         onChanged: (value){
           switchValue= value;          
           setState(() { 
           });
         },
       ),
      ),
    );
  }
  // ----------Functions----------
  changeButtonState(){
    if(state){
      state = false;
      buttonText ='Hello';
      buttonColor = Colors.blue;
    }
    else{
    state = true;
    buttonText = 'Flutter';
    buttonColor = Colors.yellow;
  }
  setState(() {});
  
  }
}