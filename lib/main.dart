import 'package:flutter/material.dart';
import 'package:flutter_app/start_screen.dart';

void main() {
  runApp(const MaterialApp(
    home: SafeArea(
      child: Scaffold(
        body: StartScreen(),
      ),
    ),
  ));
}
