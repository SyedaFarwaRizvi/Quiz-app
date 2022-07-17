import 'package:flutter/material.dart';
import 'package:quiz_app/Constants.dart';
import 'package:quiz_app/Models/QuestionModel.dart';
import 'package:quiz_app/Widgets.dart/QuestionWidget.dart';
import 'package:quiz_app/Widgets.dart/NextButton.dart';
import 'package:quiz_app/Widgets.dart/Options.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Question> _questions = [
    Question(
        id: '10',
        title: 'What is 2+2?',
        options: {'5': false, '30': false, '4': true, '10': false}),
    Question(
        id: '11',
        title: 'What is 10+20?',
        options: {'5': false, '3': false, '30': true, '1': false}),
  ];

  int index = 0;
  bool isPressed = false;

  void nextQuestion() {
    if (index == _questions.length - 1) {
      return;
    } else {
      if (isPressed) {
        setState(() {
          index++;
          isPressed = false;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Please select any option'),
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.symmetric(vertical: 20.0),
        ));
      }
    }
  }

  changeColor() {
    setState(() {
      isPressed = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        title: const Text('Quiz App'),
        backgroundColor: background,
        shadowColor: Colors.transparent,
      ),
      // ignore: sized_box_for_whitespace
      body: Container(
        width: double.infinity,
        child: Column(children: [
          QuestionWidget(
              question: _questions[index].title,
              indexAction: index,
              totalQuestion: _questions.length),
          Divider(
            color: neutral,
          ),
          const SizedBox(height: 25.0),
          for (int i = 0; i < _questions[index].options.length; i++)
            Options(
              options: _questions[index].options.keys.toList()[i],
              color: isPressed
                  ? _questions[index].options.values.toList()[i] == true
                      ? correct
                      : incorrect
                  : neutral,
              isClicked: isPressed,
              onTap: changeColor,
            )
        ]),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: NextButton(
          nextQuestion: nextQuestion,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
