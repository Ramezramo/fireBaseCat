import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../store_app/models/Task.dart';
import '../Prain/ListMap.dart';
import 'TasksTile.dart';

// import '../Prain/ListMap.dart';
// import 'TasksTile.dart';

class TskList extends StatefulWidget {
  // final List<Task> tasks;
  // TskList({required this.tasks});
  @override
  State<TskList> createState() => _TskListState();
}

class _TskListState extends State<TskList> {


  @override
  Widget build(BuildContext context) {
    TodoItemNotifier TaskClussProvider2 = Provider.of<TodoItemNotifier>(context, listen: true);
    // print(titlesInTheApp.length);
    return ListView.builder(

        itemCount: TaskClussProvider2.titlesInTheApp.length,
        itemBuilder: (BuildContext context, int index) {
          return TaskTile(
            longpress: () {
              print(TaskClussProvider2.titlesInTheApp[index]);
              TaskClussProvider2.delete(TaskClussProvider2.titlesInTheApp[index]);
            },
            boxCheckedOrNo: TaskClussProvider2.titlesInTheApp[index].isDone,
            title: TaskClussProvider2.titlesInTheApp[index].name,

            checkBoxCallback:(bool? newValue) {
              setState(() {
                TaskClussProvider2.titlesInTheApp[index].toggleDone();
              });
            },
          );

        });
  }

// child:
}
