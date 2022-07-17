import 'package:flutter/material.dart';
import 'package:quiz_app/Constants.dart';

class Options extends StatelessWidget {
  Options({
    Key? key,
    required this.options,
    required this.isClicked,
    required this.color,
    required this.onTap,
  }) : super(key: key);

  final String options;
  final bool isClicked;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: isClicked ? color : neutral,
        child: ListTile(
          title: Text(
            options,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 22.0,
            ),
          ),
        ),
      ),
    );
  }
}
