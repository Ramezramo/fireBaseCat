import 'package:flutter/material.dart';

const kSendButtonTextStyle = TextStyle(
  color: Colors.lightBlueAccent,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  border: InputBorder.none,
);
Color kBackgroundcolor = Colors.white;

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
  ),
);
//there is two ways to do it this is the fisrt one
bool kvisible_Orno = true; // this for the text password field to check if invisible or not

InputDecoration K_decoration (hint_text,raidos_circuler) {
  double _raidos_circuler = raidos_circuler == "default" ? 32 : raidos_circuler  ;
  return InputDecoration(
    hintText: hint_text,
    // labelStyle: TextStyle(color:Colors.black ),
    // fillColor: Colors.black,

    hintStyle: TextStyle(color: Colors.black26),

    suffixIcon: null,


    contentPadding:
    EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(_raidos_circuler)),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
      borderRadius: BorderRadius.all(Radius.circular(_raidos_circuler)),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
      borderRadius: BorderRadius.all(Radius.circular(_raidos_circuler)),
    ),
  );
}
// second way
