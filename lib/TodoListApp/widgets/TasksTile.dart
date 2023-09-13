import 'package:flutter/material.dart';

class TaskTile extends StatefulWidget {
  bool boxCheckedOrNo ;
  String title;
  final ValueChanged<bool?>? checkBoxCallback;
  final Function() longpress;
  // final Function(bool?) checkBoxCallback;

  TaskTile({required this.longpress,required this.boxCheckedOrNo,required this.title,required this.checkBoxCallback});

  @override
  State<TaskTile> createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  //
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: widget.longpress,
      title: Text(
        widget.title,
        style: TextStyle(
            decoration: widget.boxCheckedOrNo ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
        value: widget.boxCheckedOrNo,//in this inherited the var by putting widget
        onChanged: widget.checkBoxCallback,


      ),
    );
  }
}
// setState(() {
// boxCheckedOrNo = !boxCheckedOrNo;
// print(boxCheckedOrNo);
//
// });
// class _Lcheckbox extends StatelessWidget {
//   final bool? checkBoxState;
//   final Function(bool?) checkBoxCAllBack;
//   _Lcheckbox({Key? key, required this.checkBoxState,required this.checkBoxCAllBack }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return
//   }
// }

//
// class TaskTile extends StatefulWidget {
//
//
//   @override
//   Widget build(BuildContext context) {
//
//   }
//
//   @override
//   State<StatefulWidget> createState() {
//     // TODO: implement createState
//     throw UnimplementedError();
//   }
// }
