import 'package:flutter/material.dart';
import 'package:todo_app/constants/color_constants.dart';
import 'package:todo_app/models/tasks_list_data.dart';

class AddTask extends StatelessWidget {
  final Function refreshTasksListCallback;
  final TextEditingController _textEditingController = TextEditingController();

  AddTask({this.refreshTasksListCallback});

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
              TasksListData.tasksList.add(_textEditingController.text);
              refreshTasksListCallback();
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
