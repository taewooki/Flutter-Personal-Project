import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buttons'),
      ) ,
      body: Center(
        child: Column (
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.red,
              ),
              onLongPress: () => print('text button'),
              onPressed:(){
                int intNum1 = 10;
                int intNum2 = 20;
                print("$intNum1 + $intNum2 = ${intNum1+intNum2}"); 
              } ,              
                child: const Text(
                'Text Button',
                  style: TextStyle(
                  fontSize: 20,
              ),
            ), 
            ),
            ElevatedButton(
                onPressed: () => print('Elevated Button'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                  )
                ),
                child: const Text('Elevated Button')
            ),
              OutlinedButton(
                  onPressed: () => print('Outlined Button'),
                  style: OutlinedButton.styleFrom(                  
                  foregroundColor: Colors.green,
                  side: const BorderSide(
                    color: Colors.black,
                    width: 2.0
                      ),
                  ),
                child: const Text('Outlined Button'),
              ),
        
            TextButton.icon(
              onPressed:() => print('Text Button Icon'),
              icon: Icon(
                Icons.home,
                size: 30,
                color: Colors.orange,                
              ),
              label: const Text('Go to home'),
              style: TextButton.styleFrom(
                foregroundColor: Colors.black,
              ),
            ),
            ElevatedButton.icon(
              onPressed: () => print('Elevated Button Icon'),
              icon: Icon(
                Icons.home
              ),
              label: const Text('home'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.green,
                minimumSize: Size(10, 40)
              ),
            ),
            OutlinedButton.icon(
              onPressed: () => print('Outlined Button'),
              icon: Icon(
                Icons.home                
              ),
              label: const Text('Go to home'),
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                minimumSize: Size(10,40)
              ),
            ),
          ],
        ),
      ),
    );
  }
}