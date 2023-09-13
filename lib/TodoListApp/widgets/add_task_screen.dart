// import 'package:firebase_cat/component/rounded_button.dart';
import 'package:firebase_cat/Reuseable_widgets/myCatButton.dart';
import 'package:firebase_cat/Reuseable_widgets/myCatTextField.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../store_app/models/Task.dart';
import '../Prain/ListMap.dart';
import 'TasksTile.dart';

TextEditingController _textEditingController = TextEditingController();
class AddTaskScreen extends StatelessWidget {
  // final ValueChanged<bool?>? addtaskcallback;
  // AddTaskScreen({required this.addtaskcallback});




  @override
  Widget build(BuildContext context) {
    TodoItemNotifier TaskClussProvider = Provider.of<TodoItemNotifier>(context, listen: true);
    // TodoItemNotifier _itemNotfierFromProvider = Provider.of<titlesInTheApp>(context, listen: false);
    return Container(
      color: Color(0xff757575),
      
      child: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text("Add Task",style: TextStyle(color: Colors.lightBlueAccent,fontSize: 30)),
            ),
            Container(margin: EdgeInsets.only(top: 12,left: 20,right: 20),child: MyTextField(addDecaration: false,hint_text: null, is_password: false,textEditingController: _textEditingController,)),

            MyButton(onPressed: (){
              // TaskTile(_textEditingController!.text, boxCheckedOrNo: null, title: '', checkBoxCallback: (bool? value) {  },);
              TaskClussProvider.addTask(Task(name: _textEditingController!.text));
              // addtaskcallback(_textEditingController!.text);

              _textEditingController.clear();
              Navigator.of(context).pop();
            },color: Colors.lightBlueAccent,title: Text("Add"),),
          ],
        ),
        decoration: BoxDecoration(

          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),

          ),

        ),
      ),);
  }
}

