import 'package:flutter/material.dart';
import 'checkbox.dart';

class TaskTile extends StatefulWidget {
  final String text;

  TaskTile({this.text});

  @override
  _TaskTileState createState() => _TaskTileState(this.text);
}

class _TaskTileState extends State<TaskTile> {
  bool isChecked = false;
  String text;

  _TaskTileState(this.text);

  void checkboxCallback(bool checkboxState) {
    setState(() {
      isChecked = !isChecked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        text,
        style: TextStyle(
          fontSize: 24.0,
          decoration: isChecked ? TextDecoration.lineThrough : null,
          decorationThickness: 3.85,
        ),
      ),
      trailing: TaskCheckbox(
        checkboxState: isChecked,
        toggleCheckboxState: checkboxCallback,
      ),
    );
  }
}
