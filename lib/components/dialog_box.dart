import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  DialogBox({super.key, required this.controller, required this.onSave});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'New Task',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
      content: SizedBox(
        // 宽度占满屏幕的 80%
        width: MediaQuery.of(context).size.width * 0.8,
        height: 160,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                  hintText: 'Task Name', border: OutlineInputBorder()),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: onSave,
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  )),
                  child: const Text('Save'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
