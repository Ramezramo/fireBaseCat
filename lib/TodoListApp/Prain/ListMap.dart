import 'package:flutter/material.dart';

import '../../store_app/models/Task.dart';
import '../widgets/TasksTile.dart';


// class TodoItemNotifier with

class TodoItemNotifier with ChangeNotifier{
  List<Task> titlesInTheApp = [
    Task(name: "learn dart"),
    Task(name: "learn python"),
    Task(name: "learn java")
  ];
  String myName = "ramez malak";
  void addTask(Task task) {
    titlesInTheApp.add(task);
    notifyListeners();
  }

  void delete(item_name){
    titlesInTheApp.remove(item_name);
    notifyListeners();
  }
}