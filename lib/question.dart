import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String questionText;
  // this final tells dart that the value wont change after it has been assigned using the constructor

  Question(this.questionText);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // container takes full width
      margin: EdgeInsets.all(10),
      child: Text(
        questionText,
        style: TextStyle(fontSize: 28),
        textAlign: TextAlign.center,
        // TextStyle and TextAlign are just styling slasses and not widgets
      ),
    );
  }
}
