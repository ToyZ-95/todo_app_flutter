import 'dart:async';

enum Actions {
  AddTask,
}

class TasksListBloc {
  List<String> tasksList = [];

  final _stateTasksListCotroller = StreamController<List<String>>();
  StreamSink<List<String>> get stateTasksListSink =>
      _stateTasksListCotroller.sink;
  Stream<List<String>> get stateTasksListStream =>
      _stateTasksListCotroller.stream;

  final _eventTasksListCotroller = StreamController<Actions>();
  StreamSink<Actions> get eventTasksListSink => _eventTasksListCotroller.sink;
  Stream<Actions> get eventTasksListStream => _eventTasksListCotroller.stream;

  final _stateTasksListLengthCotroller = StreamController<int>();
  StreamSink<int> get stateTasksListLengthSink =>
      _stateTasksListLengthCotroller.sink;
  Stream<int> get stateTasksListLengthStream =>
      _stateTasksListLengthCotroller.stream;

  TasksListBloc() {
    eventTasksListStream.listen(
      (event) {
        if (event == Actions.AddTask) {
          stateTasksListSink.add(tasksList);
          stateTasksListLengthSink.add(tasksList.length);
        }
      },
    );
  }

  addTask(String task) {
    tasksList.add(task);
    eventTasksListSink.add(Actions.AddTask);
  }

  void dispose() {
    _stateTasksListCotroller.close();
    _eventTasksListCotroller.close();
    _stateTasksListLengthCotroller.close();
  }
}
