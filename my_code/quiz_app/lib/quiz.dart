import 'package:flutter/material.dart';

import 'package:quiz_app/start_screen.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  // @override
  // void initState() {
  //   activeScreen = StartScreen(switchScreen);
  //   super.initState();
  // }
  // Widget? activeScreen;
  // void switchScreen() {
  //   setState(() {
  //     activeScreen = const QuestionsScreen();
  //   });
  // }
  List<String> selectedAnswers = [];
  String activeScreen = 'start-screen';
  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'results-screen';
      });
    } else {
      // move to the next question
    }
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'start-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Quiz Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        // appBar: AppBar(title: const Text('Flutter Quiz Demo')),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 102, 23, 49),
                Color.fromARGB(255, 81, 21, 92),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          // child: activeScreen,
          child: switch (activeScreen) {
            'start-screen' => StartScreen(switchScreen),
            'questions-screen' => QuestionsScreen(onSelectAnswer: chooseAnswer),
            'results-screen' => ResultsScreen(
              onRestartQuiz: restartQuiz,
              chosenAnswers: selectedAnswers,
            ),
            _ => const SizedBox(),
          },
        ),
      ),
    );
  }
}
