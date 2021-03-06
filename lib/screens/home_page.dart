import 'package:flutter/material.dart';
import 'package:todo_app/blocs/tasks_list_bloc.dart';
import 'package:todo_app/constants/color_constants.dart';
import 'package:todo_app/screens/add_task.dart';
import 'package:todo_app/widgets/tasks_list.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage();

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget buildBottomSheet(BuildContext context) {
    return Container();
  }

  final tasksListBloc = TasksListBloc();

  @override
  void dispose() {
    tasksListBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.primaryColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 60, left: 30, right: 30, bottom: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 30.0,
                  child: Icon(
                    Icons.list_alt_rounded,
                    color: ColorConstants.primaryColor,
                    size: 30.0,
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Text(
                  'Todoey',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 50.0,
                  ),
                ),
                StreamBuilder<int>(
                    stream: tasksListBloc.stateTasksListLengthStream,
                    initialData: 0,
                    builder: (context, snapshot) {
                      return Text(
                        snapshot.data.toString() + ' Tasks',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                        ),
                      );
                    }),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 16.0,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              child: StreamBuilder<List<String>>(
                  stream: tasksListBloc.stateTasksListStream,
                  initialData: [],
                  builder: (context, snapshot) {
                    return TasksList(
                        tasksList: snapshot.data, tasksListBloc: tasksListBloc);
                  }),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20),
              ),
            ),
            context: context,
            builder: (context) => AddTask(tasksListBloc: tasksListBloc),
          );
        },
        backgroundColor: ColorConstants.primaryColor,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
