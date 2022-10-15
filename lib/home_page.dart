import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/data/database.dart';
import 'package:todo_app/util/dialog_box.dart';
import 'package:todo_app/util/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  // text controller
  final _myBox = Hive.box("mybox");
  ToDoDataBase db = ToDoDataBase();

  @override
  void initState() {
    // if first time opening the app, create default data
    if (_myBox.get("TODOLIST") ==  null ) {
      db.createTutorialData();
    } else {
      // there is already existing data
      db.loadData();
    }
    super.initState();
  }

  final _controller = TextEditingController();


  // checkboxStatus function
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDataBase();
  }

  // save new task

  void saveNewTask() {
    setState(() {
      db.toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDataBase();
  }

  // createNewTask function
  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
      return DialogBox(
        controller: _controller,
        onSave: saveNewTask,
        onCancel: () => Navigator.of(context).pop()
      );
    },
    );
  }

  // delete task

  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Center(child: Text('To Do')),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
      ),
      backgroundColor: Colors.yellow[200],
      body: ListView.builder(
          itemCount: db.toDoList.length,
      itemBuilder: (context, index) {
        return ToDoTile(
          deleteFunction: (context) => deleteTask(index),
          taskName: db.toDoList[index][0],
          taskCompleted: db.toDoList[index][1],
          onChanged: (value) => checkBoxChanged(value, index),)
        ;
      },),
      );
  }

}
