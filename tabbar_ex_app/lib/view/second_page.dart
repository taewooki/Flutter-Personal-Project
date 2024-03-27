import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.greenAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(
                    'images/flower_01.png'
                  ),
                  radius: 60,
                )
              ],
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                  child: CircleAvatar(
                    backgroundImage: AssetImage(
                      'images/flower_02.png'
                    ),
                    radius: 60,
                  ),
                ),

                Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: CircleAvatar(
                    backgroundImage: AssetImage(
                      'images/flower_03.png'
                    ),
                    radius: 60,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}