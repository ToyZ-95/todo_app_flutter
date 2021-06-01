import 'dart:async';

class CheckboxBloc {
  final _stateCheckboxCotroller = StreamController<bool>.broadcast();
  StreamSink<bool> get stateCheckboxSink => _stateCheckboxCotroller.sink;
  Stream<bool> get stateCheckboxStream => _stateCheckboxCotroller.stream;

  final _eventCheckboxCotroller = StreamController<bool>.broadcast();
  StreamSink<bool> get eventCheckboxSink => _eventCheckboxCotroller.sink;
  Stream<bool> get eventCheckboxStream => _eventCheckboxCotroller.stream;

  CheckboxBloc() {
    eventCheckboxStream.listen((event) {
      stateCheckboxSink.add(event);
    });
  }

  void dispose() {
    _stateCheckboxCotroller.close();
    _eventCheckboxCotroller.close();
  }
}
