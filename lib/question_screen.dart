import 'package:flutter/material.dart';
import 'package:flutter_app/components/answer_button.dart';
import 'package:flutter_app/data/question.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, required this.onSelectAnswer});
  final void Function(String answer) onSelectAnswer;
  @override
  State<StatefulWidget> createState() {
    return _QuestionScreen();
  }
}

class _QuestionScreen extends State<QuestionScreen> {
  //
  var currentQuestionIdx = 0;
  void answerQuestion(String answerQuestion) {
    widget.onSelectAnswer(answerQuestion);
    setState(() {
      currentQuestionIdx++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIdx];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              currentQuestion.text,
              // style: const TextStyle(fontSize: 16, color: Colors.white, fontFamily: ),
              style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            ...currentQuestion.getShuffleAnswers().map((answer) {
              return AnswerButton(
                  answerText: answer,
                  onTap: () {
                    answerQuestion(answer);
                  });
            }),
            // AnswerButton(answerText: currentQuestion.answers[0], onTap: () {}),
            // AnswerButton(answerText: currentQuestion.answers[1], onTap: () {}),
            // AnswerButton(answerText: currentQuestion.answers[2], onTap: () {}),
            // AnswerButton(answerText: currentQuestion.answers[3], onTap: () {}),
          ],
        ),
      ),
    );
  }
}
