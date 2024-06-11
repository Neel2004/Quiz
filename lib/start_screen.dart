import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.start, {super.key});

  final void Function() start;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Opacity(   (tip: do not use this , it is very memory intensive)
          //   opacity: 0.6,
          //   child: Image.asset(
          //     'assets/images/quiz-logo.png',
          //     width: 300,
          //   ),
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            //option 2 for opacity
            color: const Color.fromARGB(
                150, 255, 255, 255), // **(make this start with 150)**
          ),
          const SizedBox(
            height: 50,
          ),
          const Text(
            'Learn Flutter the fun way!',
            style: TextStyle(
              fontSize: 23,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          OutlinedButton.icon(
            onPressed: () {
              start();
            },
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            label: const Text('Start Quiz'),
            icon: const Icon(Icons.arrow_right_alt),
          )
        ],
      ),
    );
  }
}
 