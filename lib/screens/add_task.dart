import 'package:flutter/material.dart';
import 'package:todo_app/constants/color_constants.dart';

class AddTask extends StatefulWidget {
  @override
  _AddTaskState createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
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
            onPressed: () {},
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
