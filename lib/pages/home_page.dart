import 'package:flutter/material.dart';
import 'package:todo_flutter/components/dialog_box.dart';
import 'package:todo_flutter/components/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();
  List toDoList = [
    ['Task 1', false],
    ['Task 2', true],
    ['Task 3', false]
  ];

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      toDoList[index][1] = value!;
    });
  }

  void saveNewTask() {
    setState(() {
      toDoList.add([_controller.text, false]);
    });
    _controller.clear();
    Navigator.of(context).pop();
  }

  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) =>
            DialogBox(controller: _controller, onSave: saveNewTask));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepPurple[200],
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text(
            'TODO',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          elevation: 0,
        ),
        body: ListView.builder(
          itemCount: toDoList.length,
          itemBuilder: (context, index) {
            return TodoTile(
                taskName: toDoList[index][0],
                isCompleted: toDoList[index][1],
                onCheckboxChanged: (value) => checkBoxChanged(value, index));
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: createNewTask,
          child: const Icon(Icons.add),
        ));
  }
}
