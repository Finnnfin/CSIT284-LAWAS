import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.deepPurple,
              Colors.amber
            ])
          ),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  width:200,
                  'assets/dice-images/dice-images/dice-1.png'),
                  SizedBox(height: 20),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    style: TextStyle(
                      fontSize: 28
                    ),
                    "Roll Dice"))
            ],)
            ),
        ),
      ),
    ),
  );
}
