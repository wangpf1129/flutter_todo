import 'package:flutter/material.dart';

class TodoTile extends StatelessWidget {
  final String taskName;
  final bool isCompleted;
  final void Function(bool?)? onCheckboxChanged;

  const TodoTile(
      {super.key,
      required this.taskName,
      required this.isCompleted,
      required this.onCheckboxChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
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
          Text(taskName),
        ],
      ),
    );
  }
}
