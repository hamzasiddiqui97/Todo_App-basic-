import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  bool taskCompleted;

  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;


  ToDoTile(
      {Key? key,
        required this.taskName,
        required this.taskCompleted,
        required this.onChanged,
        required this.deleteFunction

      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
                onPressed: deleteFunction,
            icon: Icons.delete,
            backgroundColor: Colors.redAccent,
            borderRadius: BorderRadius.circular(10),)
          ],
        ),
        child: Container(
          padding: EdgeInsets.all(20.0),
          decoration: BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.circular(12)),
          child: Row(
            children: [
              Checkbox(
                  activeColor: Colors.black,
                  value: taskCompleted,
                  onChanged: onChanged),
              Text(
                taskName,
                style: TextStyle(
                  decoration: taskCompleted ? TextDecoration.lineThrough : TextDecoration.none,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
