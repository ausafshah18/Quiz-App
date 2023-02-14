import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerQuestion;
  // we didn't use _ here because it is a member of different class in main.dart

  Quiz(
      {@required this.questions,
      @required this.answerQuestion,
      @required this.questionIndex});
  // required tells that all of them are required and none should be omitted

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      // We used Column to order the widgets from top to bottom
      Question(questions[questionIndex]['questionText']),
      // In questions list we select the element at index 1. We are passing the string to Question widget in another file
      ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
          .map((answer) {
        return Answer(() => answerQuestion(answer['score']), answer['text']);
        // We passed a void function to Answer() because Answer widget is taking function without arguments in its parameters. So, this void function is pointing to answerQuestion
      }).toList()
      // In above toList() we are converting the mapped objects to a list. And the ... is called spread operator takes these items from the list and adds them to the surrounding list (here children) as individual objects
    ]);
  }
}
