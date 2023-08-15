import 'package:flutter/material.dart';

import '../../core/models/question.dart';
import '../../core/route_utils/route_utils.dart';
import '../quiz_result/view.dart';

class QuizDetailsController {

  int currentQuestionIndex = 0;
  List<Question> questions = [];
  String? selectedAnswer;
  int score = 0;

  void initQuiz() {
    questions.addAll(Question.questions);
    questions.shuffle();
  }

  void selectAnswer(String value) {
    if (selectedAnswer == value) {
      selectedAnswer = null;
      return;
    }
    selectedAnswer = value;
  }

  void nextQuestion(BuildContext context) {
    if (currentQuestion.correctAnswer == selectedAnswer) {
      score++;
    }
    if (currentQuestionIndex == (questions.length - 1)) {
      RouteUtils.pushAndPopAll(
        context: context,
        view: QuizResultView(
          score: score,
          total: questions.length,
        ),
      );
      return;
    }
    currentQuestionIndex++;
    selectedAnswer = null;
  }

  Question get currentQuestion {
    return questions[currentQuestionIndex];
  }

}