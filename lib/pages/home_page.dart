import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_flutter/components/dialog_box.dart';
import 'package:todo_flutter/components/todo_tile.dart';
import 'package:todo_flutter/data/datatbase.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _todoBox = Hive.box(name: 'todoBox');
  ToDoDatabase db = ToDoDatabase();
  final _controller = TextEditingController();

  @override
  void initState() {
    if (_todoBox.get('TODO_LIST') == null) {
      db.createInitData();
      db.updateData();
    } else {
      db.loadData();
    }
    super.initState();
  }

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = value!;
    });
    db.updateData();
  }

  void saveNewTask() {
    setState(() {
      db.toDoList.add([_controller.text, false]);
    });
    db.updateData();
    _controller.clear();
    Navigator.of(context).pop();
  }

  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) =>
            DialogBox(controller: _controller, onSave: saveNewTask));
  }

  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateData();
  }

  void editTask(int index) {
    _controller.text = db.toDoList[index][0];
    showDialog(
        context: context,
        builder: (context) => DialogBox(
            controller: _controller,
            onSave: () {
              setState(() {
                db.toDoList[index][0] = _controller.text;
              });
              db.updateData();
              _controller.clear();
              Navigator.of(context).pop();
            }));
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
          itemCount: db.toDoList.length,
          itemBuilder: (context, index) {
            return TodoTile(
                taskName: db.toDoList[index][0],
                isCompleted: db.toDoList[index][1],
                onCheckboxChanged: (value) => checkBoxChanged(value, index),
                editFunction: (context) => editTask(index),
                deleteFunction: (context) => deleteTask(index));
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: createNewTask,
          child: const Icon(Icons.add),
        ));
  }
}
