import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;
  // final(list) can be modified but const
  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            color: const Color.fromARGB(166, 255, 255, 255),
          ),
          // Opacity(
          //   opacity: 0.7,
          //   child: Image.asset(
          //     'assets/images/quiz-logo.png',
          //     width: 300,
          //   ),
          // ),
          const SizedBox(
            height: 80,
          ),
           Text(
            'Learn flutter the fun way!',
            style: GoogleFonts.lato(
              color: const Color.fromARGB(255, 233, 224, 224),
              fontSize: 24,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
              textStyle: const TextStyle(
                fontSize: 24,
              ),
            ),
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text(
              'Start quiz',
            ),
          ),
        ],
      ),
    );
  }
}
