import 'package:course_adv_main/data/questions.dart';
import 'package:course_adv_main/styling_ans_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var questionIndex = 0;

  switchQuestions(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      questionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[questionIndex];
    return Container(
      margin: const EdgeInsets.all(40),
      child: SizedBox(
        // we can also use center widget
        width: double.infinity, //Use max width
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.ubuntu(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.8,
                wordSpacing: 3,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            ...currentQuestion
                .getShuffledAnswers()
                .map((answers) => AnswerButton(
                      answerText: answers,
                      onTap: () {
                        switchQuestions(answers);
                      },
                    ))
          ],
        ),
      ),
    );
  }
}
 