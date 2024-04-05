import 'package:flutter/material.dart';

import 'package:quiz_app/question_screen.dart';
import 'package:quiz_app/start_screen.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/resuslts_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  // Widget? activeScreen;

  // @override
  // void initState() {
  //   // <-- init used for one time initialisation
  //   super.initState(); // will executed before build
  //   activeScreen = StartScreen(switchScreen);
  // }

  // better approach then init state --v
  List<String> selectedAnswers = [];
  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }

  void restartQuiz(){
    setState(() {
      selectedAnswers = [];
      activeScreen ='question_screen';
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'question-screen') {
      screenWidget = QuestionScreen(
        onSelectAnswer: chooseAnswer,
      );
    }

    if (activeScreen == 'results-screen') {
      screenWidget = ResultsScreen(
        chosenAnswer: selectedAnswers,
        onRestart: restartQuiz,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 63, 61, 61),
                Color.fromARGB(255, 14, 14, 14),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          //child: activeScreen,(part of init)

          // child: activeScreen == 'start-screen'// <- condition
          //     ? StartScreen(switchScreen)// <- value used,if condition met
          //     : const QuestionScreen(),// <- value used,if not met
          //(ternary expression(better(bcz it req less code and most imp the extra init func get removed) approach than init wla))
          // ternary expression is a concept that allows us to check a condition then yields value(true or false) accordingly

          // 3rd alternative
          child: screenWidget,
        ),
      ),
    );
  }
}
