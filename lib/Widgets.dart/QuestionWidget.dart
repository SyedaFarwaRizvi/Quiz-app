import 'package:flutter/material.dart';
import 'package:quiz_app/Constants.dart';

class QuestionWidget extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  QuestionWidget(
      {Key? key,
      required this.question,
      required this.indexAction,
      required this.totalQuestion})
      : super(key: key);

  final String question;
  final int indexAction;
  final int totalQuestion;

  @override
  State<QuestionWidget> createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.all(15),
      child: Text(
        'Question ${widget.indexAction + 1}/${widget.totalQuestion}: ${widget.question}',
        style: TextStyle(
          fontSize: 24.0,
          color: neutral,
        ),
      ),
    );
  }
}
