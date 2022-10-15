import 'package:flutter/material.dart';
import 'package:todo_app/util/my_button.dart';

class DialogBox extends StatelessWidget {
  final dynamic controller;

  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox({Key? key,
  required this.controller,
  required this.onSave,
  required this.onCancel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[300],
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // get user input
            TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: 'Add a new task',
                border: OutlineInputBorder(),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // save button
                MyButton(text: "Save", onPressed: onSave),
                  // gap between two buttons
                SizedBox(width: 10),

                  // cancel button
                MyButton(text: "Cancel", onPressed: onCancel),
              ],

            )
          ],
        ),
      ),
    );
  }
}
