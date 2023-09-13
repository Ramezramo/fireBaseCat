import 'package:firebase_cat/TodoListApp/widgets/TasksListWedget.dart';
import 'package:firebase_cat/TodoListApp/widgets/add_task_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../store_app/models/Task.dart';
import 'Prain/ListMap.dart';

class TasksScreen extends StatefulWidget {
  static String id = "tasks_screen";
  const TasksScreen({Key? key}) : super(key: key);

  @override
  State<TasksScreen> createState() => _TasksScreen();
}

class _TasksScreen extends State<TasksScreen> {



  // const TasksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TodoItemNotifier TaskClussProvider = Provider.of<TodoItemNotifier>(context, listen: true);
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        child: Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(context: context, builder: (context) => AddTaskScreen());
        },
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(top: 60, left: 30, right: 30, bottom: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  child:
                      Icon(Icons.list, size: 30, color: Colors.lightBlueAccent),
                  backgroundColor: Colors.white,
                  radius: 30,
                ),
                SizedBox(
                  height: 13,
                ),
                Text(
                  "Todoy",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  "${TaskClussProvider.titlesInTheApp.length} tasks",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              height: 300,
              // width: ,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: TskList(),
            ),
          ),
        ],
      ),
    );
  }
}

