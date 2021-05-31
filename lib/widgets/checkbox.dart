import 'package:flutter/material.dart';
import 'package:todo_app/constants/color_constants.dart';

class TaskCheckbox extends StatelessWidget {
  final bool checkboxState;
  final Function toggleCheckboxState;
  TaskCheckbox({this.checkboxState, this.toggleCheckboxState});

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      activeColor: ColorConstants.primaryColor,
      value: checkboxState,
      onChanged: toggleCheckboxState,
    );
  }
}
