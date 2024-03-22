import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  //Property
  late bool switchValue;
  late String titleText;

  @override
  void initState() {   
    super.initState();
      switchValue = true;
      titleText= 'Smile';  
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titleText),                    
        
      ),
      body: Center(
        child: Switch(
          value: switchValue, 
          onChanged: (value){
            switchValue = value;
            titleC(value);
            setState(() {});
          } ,
          ),
      ),
    );   
  }
  //-------Functions------
  
  titleC(bool value){
  titleText = (value == true? 'Smile' : 'Pikachu');
  }

}