import 'package:flutter/material.dart';
import '/screens/quiz_screen.dart';


var logo = 'assets/logo.png';
  
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        body: Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 72, 0, 145)
          ),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(logo, width: 250,),
                SizedBox(height: 35),
                Text('Learn Flutter the fun way!', 
                style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 22.5,
                ),
                ),
                SizedBox(height: 35),
                ElevatedButton(onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => QuizScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(0, 72, 0, 144),
                ),
                child: Text('Start Quiz',
                style:TextStyle(color: Colors.white),
                )
                ),
              ],
            )
            ),
        ),
      );
  }
}