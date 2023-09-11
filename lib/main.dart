import 'package:flutter/material.dart';
import 'package:flutter_app/start_screen.dart';

void main() {
  runApp(MaterialApp(
    home: SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.deepPurple, Colors.purple],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight)),
          child: const StartScreen(),
        ),
      ),
    ),
  ));
}
