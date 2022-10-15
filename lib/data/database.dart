import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase{

  // first time login will have empty list
  List toDoList = [];

  // reference our box
  final _myBox = Hive.box("mybox");

  // run this method if this is first time ever opening the app
  void createTutorialData() {
    toDoList = [
      ["Push up", true],
    ];
  }

  // to load data from database
  void loadData() {
    toDoList = _myBox.get("TODOLIST");

  }

  // update database
  void updateDataBase() {
    _myBox.put("TODOLIST", toDoList);
  }
}