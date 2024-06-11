import 'package:course_adv_main/data/questions.dart';
import 'package:course_adv_main/questions_screen.dart';
import 'package:course_adv_main/results_screen.dart';
import 'package:course_adv_main/start_screen.dart';
import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  var activeScreen = 'startscreen';
  List<String> selectedAnswers = [];

  // Method 1 (more code)
  // Widget? activeScreen;

  // @override
  // void initState() {
  //   activeScreen = StartScreen(switchScreen);
  //   super.initState();
  // }

  void switchScreen() {
    setState(() {
      activeScreen = 'questionscreen';
    });
  }

  void chosenAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'resultscreen';
      });
    }
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'startscreen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'questionscreen') {
      screenWidget = QuestionsScreen(
        onSelectAnswer: chosenAnswer,
      );
    } else if (activeScreen == 'resultscreen') {
      screenWidget = ResultScreen(
        chosenAnswers: selectedAnswers,
        onRestart: restartQuiz,
      );
    } else {
      screenWidget = StartScreen(switchScreen);
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 78, 13, 151),
                Color.fromARGB(255, 107, 15, 168),
              ],
              // begin: Alignment.topRight,
              // end: Alignment.bottomLeft,
            ),
          ),
          // Method 2 : Ternary Operator
          // child: activeScreen == 'startscreen'
          //     ? StartScreen(switchScreen)
          //     : const QuestionsScreen(),
          child: screenWidget,
        ),
      ),
    );
  }
}
