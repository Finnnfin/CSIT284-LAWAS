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
            child: Text("Hello World"),
            ),
        ),
      ),
    ),
  );
}
