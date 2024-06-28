import 'package:hive/hive.dart';

class ToDoDatabase {
  List toDoList = [];

  final _todoBox = Hive.box(name: 'todoBox');
  void createInitData() {
    toDoList = [
      ['Task 1', false],
      ['Task 2', false],
      ['Task 3', false],
    ];
  }

  void loadData() {
    toDoList = _todoBox.get('TODO_LIST', defaultValue: []);
  }

  void updateData() {
    _todoBox.put('TODO_LIST', toDoList);
  }
}
