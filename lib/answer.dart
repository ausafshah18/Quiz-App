import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function selectHandler;
  // Function here means what is stored here has to be a pointer to a function
  final String answerText;
  Answer(this.selectHandler, this.answerText);
  // here we are receiving a pointer to _answerQuestion
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.green)),
        onPressed:
            selectHandler, // by not putting () infront of function call we tell dart to call it only when it is pressed
        child: Text(answerText),
        // this Text() above is the text written on button
      ),
    );
  }
}
