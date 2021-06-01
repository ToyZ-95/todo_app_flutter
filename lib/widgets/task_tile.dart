import 'package:flutter/material.dart';
import 'package:todo_app/blocs/checkbox_bloc.dart';
import 'checkbox.dart';

class TaskTile extends StatefulWidget {
  final String text;
  TaskTile({this.text});

  @override
  _TaskTileState createState() => _TaskTileState(this.text);
}

class _TaskTileState extends State<TaskTile> {
  String text;
  _TaskTileState(this.text);

  final CheckboxBloc checkboxBloc = CheckboxBloc();

  @override
  void dispose() {
    checkboxBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
        stream: checkboxBloc.stateCheckboxStream,
        initialData: false,
        builder: (context, snapshot) {
          return ListTile(
            title: Text(
              text,
              style: TextStyle(
                fontSize: 24.0,
                decoration: snapshot.data ? TextDecoration.lineThrough : null,
                decorationThickness: 3.85,
              ),
            ),
            trailing: TaskCheckbox(
              checkboxState: snapshot.data,
              checkboxBloc: checkboxBloc,
            ),
          );
        });
  }
}
