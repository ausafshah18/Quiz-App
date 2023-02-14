import "package:flutter/material.dart"; // we are importing this package from flutter framework as the connection is established with flutter in dependencies in "pubspec.yaml" file. It has pre styled material wdigets.
//It has a base class which allows us to create our own widgets
import './quiz.dart';
import './result.dart';

// void main() {
//   runApp(
//       MyApp());
// }  We dont use this long syntax but the below one liner

void main() => runApp(
    MyApp()); // runApp() is from material.dart, it takes our widget "MyApp" and runs that on the app. Basically it calls the build fuction

class MyApp extends StatefulWidget {
  // This inheritance turns our class (MyApp) into a class that can be used as a widget by flutter
  @override // here we are overriding as we want the below createState() to run and not the createState() of StatefulWidget class
  State<StatefulWidget> createState() {
    // createState() has to return a State object connected to a StatefulWidget
    // TODO: implement createState
    return _MyAppState(); // the underscore signifies that MyAppState can only be used in the main dart file i.e the MyApp class
    // throw UnimplementedError();
  }
}

class _MyAppState extends State<MyApp> {
  // MyAppState is an object connected to State and that is connected to MyApp which is a StatefulWidget
  // state is from materialdart and it is a generic class. This "State" class belongs to the above "Widget" class. So, "MyApp" will re-render but the "State" (MyAppState) will not change
  // State<MyApp> tells flutter that "State" belongs to "MyApp"
  final _questions = const [
    // a list of string data
    // we used _ here because it is a function of class
    {
      // These curly brackets represent Map , which stores key-value pairs
      'questionText': 'What\'s your favourite colour?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1},
      ],
    },
    {
      'questionText': 'What\'s your favourite animal? ',
      'answers': [
        {'text': 'Rabbit', 'score': 3},
        {'text': 'Snake', 'score': 11},
        {'text': 'Elephant', 'score': 5},
        {'text': 'Lion', 'score': 9}
      ],
    },
    {
      'questionText': 'Who\'s your favourite instructor? ',
      'answers': [
        {'text': 'Ausaf', 'score': 1},
        {'text': 'Shahid', 'score': 2},
        {'text': 'Tazeem', 'score': 2},
        {'text': 'Arfat', 'score': 2},
      ],
    }
  ];
  var _questionIndex = 0;
  var _totalScore = 0;
  // class variable. For this we created MyApp class which extends from statefulWidget because we can't use it in stateless widgets as it changes.

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    // The underscore signifies that this function can only be used in thus particular class
    // member function of MyApp class

    _totalScore += score;
    setState(() {
      // setState is a method from "State" where we write the code which changes the property. It calls the build() again of the widget where you calls the setState(here it is MyAppState)
      _questionIndex = _questionIndex + 1;
    });

    print(_questionIndex);
  }

  @override // this shows that we delibrately did override as in the build function that we created will run and not the one that "StatelessWidget" class has
  Widget build(BuildContext context) {
    // Here 'BuildContext' is a class and 'context' is an object. build() will return a Widget(Widget is a class(provided by material.dart) which automatically is a type of data), basically returns our widget tree.

    return MaterialApp(
      home: Scaffold(
        // MaterailApp() is a (class and we can pass data to it with a feature called constructor) widget provided by material.dart which does some setup to transform our combination of widgets into an app. 'home' argument(a named argument) is a core widget which flutter will bring onto the screen when the app is mounted to the screen. Scaffold() will give us a coloring scheme and structure for UI of a mobile app .'Text()' is also a widget with which we can print on the screen
        appBar: AppBar(
          title: Text("My first title"),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                // Quiz is a custom widget
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
