import 'package:flutter/material.dart';
import 'package:todo_app/blocs/checkbox_bloc.dart';
import 'package:todo_app/constants/color_constants.dart';

class TaskCheckbox extends StatelessWidget {
  final bool checkboxState;
  final CheckboxBloc checkboxBloc;
  TaskCheckbox({this.checkboxState, this.checkboxBloc});

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      activeColor: ColorConstants.primaryColor,
      value: checkboxState,
      onChanged: (value) {
        checkboxBloc.eventCheckboxSink.add(value);
      },
    );
  }
}
