import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
      Image.asset(
        'assets/images/quiz-logo.png',
        width: 300,
      ),
      const SizedBox(height: 20),
      const Text(
        'Learn flutter the fun way!',
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
      const SizedBox(height: 30),
      OutlinedButton.icon(
          style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
          onPressed: () {},
          icon: const Icon(Icons.arrow_right_alt),
          label: const Text('Start Quiz'))
    ]));
  }
}
