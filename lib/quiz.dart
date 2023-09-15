import 'package:flutter/material.dart';
import 'package:flutter_app/data/question.dart';
import 'package:flutter_app/question_screen.dart';
import 'package:flutter_app/result_screen.dart';
import 'package:flutter_app/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<StatefulWidget> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  // Widget? activeScreen;
  var activeScreenStr = 'start-screen';
  // @override
  // void initState() {
  //   super.initState();
  //   // activeScreen = StartScreen(switchScreen);
  // }

  void switchScreen() {
    setState(() {
      // activeScreen = const QuestionScreen();
      activeScreenStr = 'question-screen';
    });
  }

  //Choose answers
  List<String> selectedAnswers = [];
  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        // selectedAnswers = [];
        activeScreenStr = 'result-screen';
      });
    }
  }

  //Restart Quiz
  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreenStr = 'start-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(switchScreen);
    if (activeScreenStr == 'question-screen') {
      screenWidget = QuestionScreen(
        onSelectAnswer: chooseAnswer,
      );
    }
    if (activeScreenStr == 'result-screen') {
      screenWidget = ResultsScreen(
        choosenAnswers: selectedAnswers,
        restartQuiz: restartQuiz,
      );
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.deepPurple, Colors.purple],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight)),
            child: screenWidget,
          ),
        ),
      ),
    );
  }
}
