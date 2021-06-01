import 'package:flutter/material.dart';
import 'package:todo_app/blocs/tasks_list_bloc.dart';
import 'package:todo_app/constants/color_constants.dart';

class AddTask extends StatelessWidget {
  final TextEditingController _textEditingController = TextEditingController();

  final TasksListBloc tasksListBloc;

  AddTask({this.tasksListBloc});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(
        20.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Add Task',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: ColorConstants.primaryColor,
              fontSize: 30.0,
            ),
          ),
          TextField(
            controller: _textEditingController,
            autofocus: true,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: ColorConstants.primaryColor,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          TextButton(
            onPressed: () {
              tasksListBloc.addTask(_textEditingController.text);
              Navigator.pop(context);
            },
            child: Text(
              'Add',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24.0,
              ),
            ),
            style: TextButton.styleFrom(
              backgroundColor: ColorConstants.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
