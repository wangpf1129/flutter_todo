import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTile extends StatelessWidget {
  final String taskName;
  final bool isCompleted;
  final void Function(bool?)? onCheckboxChanged;
  final void Function(BuildContext)? editFunction;
  final void Function(BuildContext)? deleteFunction;

  const TodoTile(
      {super.key,
      required this.taskName,
      required this.isCompleted,
      required this.onCheckboxChanged,
      required this.editFunction,
      required this.deleteFunction});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(8),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: editFunction,
              icon: Icons.edit,
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              label: 'Edit',
              borderRadius:
                  const BorderRadius.horizontal(left: Radius.circular(8)),
            ),
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              label: 'Delete',
              borderRadius:
                  const BorderRadius.horizontal(right: Radius.circular(8)),
            ),
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.deepPurple[100],
            borderRadius: BorderRadius.circular(8),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(0, 2),
                blurRadius: 4,
              ),
            ],
          ),
          child: Row(
            children: [
              Checkbox(
                value: isCompleted,
                onChanged: onCheckboxChanged,
              ),
              Text(
                taskName,
                style: TextStyle(
                  decoration: isCompleted
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
